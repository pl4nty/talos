// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Package soquartzcm4 provides the Pine64 SOQuartz board implementation on a CM4 carrier board.
package soquartzcm4

import (
	"os"
	"path/filepath"

	"github.com/siderolabs/go-procfs/procfs"
	"golang.org/x/sys/unix"

	"github.com/siderolabs/talos/internal/app/machined/pkg/runtime"
	"github.com/siderolabs/talos/pkg/copy"
	"github.com/siderolabs/talos/pkg/machinery/constants"
)

var (
	bin       = constants.BoardSOQuartzCM4 + "/u-boot-rockchip.bin"
	off int64 = 512 * 64
	dtb       = "rockchip/rk3566-soquartz-cm4.dtb"
)

// SOQuartzCM4 represents the Pine64 SOQuartz board on a CM4 carrier board.
//
// Reference: https://wiki.pine64.org/wiki/SOQuartz
type SOQuartzCM4 struct{}

// Name implements the runtime.Board.
func (b *SOQuartzCM4) Name() string {
	return constants.BoardSOQuartzCM4
}

// Install implements the runtime.Board.
func (b *SOQuartzCM4) Install(options runtime.BoardInstallOptions) (err error) {
	var f *os.File

	if f, err = os.OpenFile(options.InstallDisk, os.O_RDWR|unix.O_CLOEXEC, 0o666); err != nil {
		return err
	}

	defer f.Close() //nolint:errcheck

	uboot, err := os.ReadFile(filepath.Join(options.UBootPath, bin))
	if err != nil {
		return err
	}

	options.Printf("writing %s at offset %d", bin, off)

	var n int

	n, err = f.WriteAt(uboot, off)
	if err != nil {
		return err
	}

	options.Printf("wrote %d bytes", n)

	// NB: In the case that the block device is a loopback device, we sync here
	// to esure that the file is written before the loopback device is
	// unmounted.
	err = f.Sync()
	if err != nil {
		return err
	}

	src := filepath.Join(options.DTBPath, dtb)
	dst := filepath.Join(options.MountPrefix, "/boot/EFI/dtb", dtb)

	err = os.MkdirAll(filepath.Dir(dst), 0o600)
	if err != nil {
		return err
	}

	return copy.File(src, dst)
}

// KernelArgs implements the runtime.Board.
func (b *SOQuartzCM4) KernelArgs() procfs.Parameters {
	return []*procfs.Parameter{
		procfs.NewParameter("console").Append("tty0").Append("ttyS2,1500000n8"),
		procfs.NewParameter(constants.KernelParamDashboardDisabled).Append("1"),
	}
}

// PartitionOptions implements the runtime.Board.
func (b *SOQuartzCM4) PartitionOptions() *runtime.PartitionOptions {
	return &runtime.PartitionOptions{PartitionsOffset: 2048 * 10}
}
