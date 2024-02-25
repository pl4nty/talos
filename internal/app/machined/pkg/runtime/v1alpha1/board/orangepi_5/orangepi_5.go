// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Package orangepi5 provides the Xunlong Orange Pi Pi 5 implementation.
package orangepi5

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
	dtb = "rockchip/rk3588s-orangepi-5.dtb"
)

// OrangePi5 represents the Xunlong Orange Pi 5 board.
type OrangePi5 struct{}

// Name implements the runtime.Board.
func (r *OrangePi5) Name() string {
	return constants.BoardOrangePi5
}

// Install implements the runtime.Board.
func (r *OrangePi5) Install(options runtime.BoardInstallOptions) (err error) {
	var f *os.File

	if f, err = os.OpenFile(options.InstallDisk, os.O_RDWR|unix.O_CLOEXEC, 0o666); err != nil {
		return err
	}

	// No need to write to write uboot to the disk, as it is already present in
	// the SPI flash.

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
func (r *OrangePi5) KernelArgs() procfs.Parameters {
	return []*procfs.Parameter{
		procfs.NewParameter("console").Append("tty0").Append("ttyS2,1500000"),
		procfs.NewParameter("sysctl.kernel.kexec_load_disabled").Append("1"),
		procfs.NewParameter(constants.KernelParamDashboardDisabled).Append("1"),
	}
}

// PartitionOptions implements the runtime.Board.
func (r *OrangePi5) PartitionOptions() *runtime.PartitionOptions {
	return nil
}
