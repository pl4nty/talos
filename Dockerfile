# syntax = docker/dockerfile-upstream:1.19.0-labs

# Meta args applied to stage base names.

ARG TOOLS=scratch
ARG PKGS=scratch
ARG INSTALLER_ARCH=scratch
ARG DEBUG_TOOLS_SOURCE=scratch

ARG PKGS_PREFIX=scratch
ARG TOOLS_PREFIX=scratch

ARG GENERATE_VEX_PREFIX=scratch
ARG GENERATE_VEX=scratch

ARG PKG_APPARMOR=scratch
ARG PKG_CA_CERTIFICATES=scratch
ARG PKG_CNI=scratch
ARG PKG_CONTAINERD=scratch
ARG PKG_CPIO=scratch
ARG PKG_CRYPTSETUP=scratch
ARG PKG_DOSFSTOOLS=scratch
ARG PKG_E2FSPROGS=scratch
ARG PKG_FHS=scratch
ARG PKG_FLANNEL_CNI=scratch
ARG PKG_GLIB=scratch
ARG PKG_GRUB=scratch
ARG PKG_IPTABLES=scratch
ARG PKG_IPXE=scratch
ARG PKG_KERNEL=scratch
ARG PKG_KMOD=scratch
ARG PKG_LIBAIO=scratch
ARG PKG_LIBATTR=scratch
ARG PKG_LIBBURN=scratch
ARG PKG_LIBCAP=scratch
ARG PKG_LIBINIH=scratch
ARG PKG_LIBISOBURN=scratch
ARG PKG_LIBISOFS=scratch
ARG PKG_LIBJSON_C=scratch
ARG PKG_LIBLZMA=scratch
ARG PKG_LIBMNL=scratch
ARG PKG_LIBNFTNL=scratch
ARG PKG_LIBPOPT=scratch
ARG PKG_LIBSELINUX=scratch
ARG PKG_LIBSEPOL=scratch
ARG PKG_LIBURCU=scratch
ARG PKG_LINUX_FIRMWARE=scratch
ARG PKG_LVM2=scratch
ARG PKG_MTOOLS=scratch
ARG PKG_MUSL=scratch
ARG PKG_NFTABLES=scratch
ARG PKG_OPENSSL=scratch
ARG PKG_OPEN_VMDK=scratch
ARG PKG_PCRE2=scratch
ARG PKG_PIGZ=scratch
ARG PKG_QEMU_TOOLS=scratch
ARG PKG_RUNC=scratch
ARG PKG_SD_BOOT=scratch
ARG PKG_SQUASHFS_TOOLS=scratch
ARG PKG_SYSTEMD_UDEVD=scratch
ARG PKG_TALOSCTL_CNI_BUNDLE=scratch
ARG PKG_TAR=scratch
ARG PKG_UTIL_LINUX=scratch
ARG PKG_XFSPROGS=scratch
ARG PKG_XZ=scratch
ARG PKG_ZLIB=scratch
ARG PKG_ZSTD=scratch

ARG DEBUG_TOOLS_SOURCE=scratch

ARG EMBED_TARGET=embed

# Resolve package images using ${PKGS} to be used later in COPY --from=.

FROM ${PKG_FHS} AS pkg-fhs
FROM ${PKG_CA_CERTIFICATES} AS pkg-ca-certificates

FROM --platform=riscv64 ${PKG_APPARMOR} AS pkg-apparmor-riscv64

FROM --platform=riscv64 ${PKG_CRYPTSETUP} AS pkg-cryptsetup-riscv64

FROM --platform=riscv64 ${PKG_CONTAINERD} AS pkg-containerd-riscv64

FROM --platform=riscv64 ${PKG_DOSFSTOOLS} AS pkg-dosfstools-riscv64

FROM --platform=riscv64 ${PKG_E2FSPROGS} AS pkg-e2fsprogs-riscv64

FROM --platform=riscv64 ${PKG_SYSTEMD_UDEVD} AS pkg-systemd-udevd-riscv64

FROM --platform=riscv64 ${PKG_LIBCAP} AS pkg-libcap-riscv64

FROM ${PKG_GRUB} AS pkg-grub
FROM --platform=riscv64 ${PKG_GRUB} AS pkg-grub-riscv64

FROM ${PKG_SD_BOOT} AS pkg-sd-boot
FROM --platform=riscv64 ${PKG_SD_BOOT} AS pkg-sd-boot-riscv64

FROM --platform=riscv64 ${PKG_IPTABLES} AS pkg-iptables-riscv64

FROM --platform=riscv64 ${PKG_IPXE} AS pkg-ipxe-riscv64

FROM --platform=riscv64 ${PKG_LIBATTR} AS pkg-libattr-riscv64

FROM --platform=riscv64 ${PKG_LIBINIH} AS pkg-libinih-riscv64

FROM --platform=riscv64 ${PKG_LIBJSON_C} AS pkg-libjson-c-riscv64

FROM --platform=riscv64 ${PKG_LIBMNL} AS pkg-libmnl-riscv64

FROM --platform=riscv64 ${PKG_LIBNFTNL} AS pkg-libnftnl-riscv64

FROM --platform=riscv64 ${PKG_LIBPOPT} AS pkg-libpopt-riscv64

FROM --platform=riscv64 ${PKG_LIBURCU} AS pkg-liburcu-riscv64

FROM --platform=riscv64 ${PKG_LIBSEPOL} AS pkg-libsepol-riscv64

FROM --platform=riscv64 ${PKG_LIBSELINUX} AS pkg-libselinux-riscv64

FROM --platform=riscv64 ${PKG_PCRE2} AS pkg-pcre2-riscv64

FROM --platform=riscv64 ${PKG_OPENSSL} AS pkg-openssl-riscv64

# linux-firmware is not arch-specific
FROM --platform=riscv64 ${PKG_LINUX_FIRMWARE} AS pkg-linux-firmware

FROM --platform=riscv64 ${PKG_LVM2} AS pkg-lvm2-riscv64

FROM --platform=riscv64 ${PKG_LIBAIO} AS pkg-libaio-riscv64

FROM --platform=riscv64 ${PKG_NFTABLES} AS pkg-nftables-riscv64

FROM --platform=riscv64 ${PKG_MUSL} AS pkg-musl-riscv64

FROM --platform=riscv64 ${PKG_RUNC} AS pkg-runc-riscv64

FROM --platform=riscv64 ${PKG_XFSPROGS} AS pkg-xfsprogs-riscv64

FROM ${PKG_UTIL_LINUX} AS pkg-util-linux
FROM --platform=riscv64 ${PKG_UTIL_LINUX} AS pkg-util-linux-riscv64

FROM --platform=riscv64 ${PKG_KMOD} AS pkg-kmod-riscv64

FROM --platform=riscv64 ${PKG_CNI} AS pkg-cni-riscv64

FROM --platform=riscv64 ${PKG_FLANNEL_CNI} AS pkg-flannel-cni-riscv64

FROM ${PKG_KERNEL} AS pkg-kernel
FROM --platform=riscv64 ${PKG_KERNEL} AS pkg-kernel-riscv64

FROM ${PKG_CPIO} AS pkg-cpio
FROM ${PKG_DOSFSTOOLS} AS pkg-dosfstools
FROM ${PKG_E2FSPROGS} AS pkg-e2fsprogs
FROM ${PKG_GLIB} AS pkg-glib
FROM ${PKG_KMOD} AS pkg-kmod
FROM ${PKG_LIBATTR} AS pkg-libattr
FROM ${PKG_LIBBURN} AS pkg-libburn
FROM ${PKG_LIBINIH} AS pkg-libinih
FROM ${PKG_LIBISOBURN} AS pkg-libisoburn
FROM ${PKG_LIBISOFS} AS pkg-libisofs
FROM ${PKG_LIBLZMA} AS pkg-liblzma
FROM ${PKG_LIBURCU} AS pkg-liburcu
FROM ${PKG_MTOOLS} AS pkg-mtools
FROM ${PKG_MUSL} AS pkg-musl
FROM ${PKG_OPENSSL} AS pkg-openssl
FROM ${PKG_OPEN_VMDK} AS pkg-open-vmdk
FROM ${PKG_PCRE2} AS pkg-pcre2
FROM ${PKG_PIGZ} AS pkg-pigz
FROM ${PKG_QEMU_TOOLS} AS pkg-qemu-tools
FROM ${PKG_SQUASHFS_TOOLS} AS pkg-squashfs-tools
FROM ${PKG_TAR} AS pkg-tar
FROM ${PKG_XFSPROGS} AS pkg-xfsprogs
FROM ${PKG_XZ} AS pkg-xz
FROM ${PKG_ZLIB} AS pkg-zlib
FROM ${PKG_ZSTD} AS pkg-zstd

FROM --platform=amd64 ${TOOLS_PREFIX}:${TOOLS} AS tools-amd64
FROM --platform=arm64 ${TOOLS_PREFIX}:${TOOLS} AS tools-arm64

FROM scratch AS pkg-debug-tools-scratch-amd64
FROM scratch AS pkg-debug-tools-scratch-arm64

FROM scratch AS pkg-debug-tools-bash-minimal-amd64
COPY --from=tools-amd64 /usr/bin/bash /bin/bash
COPY --from=tools-amd64 /usr/lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=tools-amd64 /usr/bin/cat /bin/cat
COPY --from=tools-amd64 /usr/bin/ls /bin/ls
COPY --from=tools-amd64 /usr/bin/tee /bin/tee

FROM scratch AS pkg-debug-tools-bash-minimal-arm64
COPY --from=tools-arm64 /usr/bin/bash /bin/bash
COPY --from=tools-arm64 /usr/lib/ld-musl-aarch64.so.1 /lib/ld-musl-aarch64.so.1
COPY --from=tools-arm64 /usr/bin/cat /bin/cat
COPY --from=tools-arm64 /usr/bin/ls /bin/ls
COPY --from=tools-arm64 /usr/bin/tee /bin/tee

FROM pkg-debug-tools-${DEBUG_TOOLS_SOURCE}-amd64 AS pkg-debug-tools-amd64
FROM pkg-debug-tools-${DEBUG_TOOLS_SOURCE}-arm64 AS pkg-debug-tools-arm64

# Strip CNI package.

FROM scratch AS pkg-cni-stripped-riscv64
COPY --from=pkg-cni-riscv64 /opt/cni/bin/bridge /opt/cni/bin/bridge
COPY --from=pkg-cni-riscv64 /opt/cni/bin/firewall /opt/cni/bin/firewall
COPY --from=pkg-cni-riscv64 /opt/cni/bin/host-local /opt/cni/bin/host-local
COPY --from=pkg-cni-riscv64 /opt/cni/bin/loopback /opt/cni/bin/loopback
COPY --from=pkg-cni-riscv64 /opt/cni/bin/portmap /opt/cni/bin/portmap
COPY --from=pkg-cni-riscv64 /usr/share/spdx/cni.spdx.json /usr/share/spdx/cni.spdx.json

FROM ${PKG_TALOSCTL_CNI_BUNDLE} AS pkgs-talosctl-cni-bundle

# The tools target provides base toolchain for the build.

FROM --platform=${BUILDPLATFORM} ${TOOLS_PREFIX}:${TOOLS} AS tools
ENV GOTOOLCHAIN=local
ENV CGO_ENABLED=0
SHELL ["/bin/bash", "-c"]

# The build target creates a container that will be used to build Talos source
# code.

FROM --platform=${BUILDPLATFORM} tools AS build
SHELL ["/bin/bash", "-c"]
ENV GO111MODULE=on
ENV GOPROXY=https://proxy.golang.org
ARG CGO_ENABLED
ENV CGO_ENABLED=${CGO_ENABLED}
ARG GOFIPS140
ENV GOFIPS140=${GOFIPS140}
ENV GOCACHE=/.cache/go-build
ENV GOMODCACHE=/.cache/mod
ARG SOURCE_DATE_EPOCH
ENV SOURCE_DATE_EPOCH=${SOURCE_DATE_EPOCH}
# Go standard library is shipped with Talos, thus it must be tracked in SBOM
COPY --link --from=tools /usr/share/spdx/golang.spdx.json /rootfs/usr/share/spdx/golang.spdx.json
WORKDIR /src

# The build-go target creates a container to build Go code with Go modules downloaded and verified.

FROM build AS build-go
COPY ./go.mod ./go.sum ./go.work ./
COPY ./pkg/machinery/go.mod ./pkg/machinery/go.sum ./pkg/machinery/
COPY ./hack/cloud-image-uploader/go.mod ./hack/cloud-image-uploader/go.sum ./hack/cloud-image-uploader/
COPY ./tools ./tools
WORKDIR /src
RUN --mount=type=cache,target=/.cache,id=talos/.cache go mod download
RUN --mount=type=cache,target=/.cache,id=talos/.cache go mod verify

# The generate target generates code from protobuf service definitions and machinery config.

FROM build AS embed-generate
ARG NAME
ARG SHA
ARG USERNAME
ARG REGISTRY
ARG TAG
ARG ARTIFACTS
ARG PKGS
ARG TOOLS
RUN mkdir -p pkg/machinery/gendata/data && \
    echo -n ${NAME} > pkg/machinery/gendata/data/name && \
    echo -n ${SHA} > pkg/machinery/gendata/data/sha && \
    echo -n ${USERNAME} > pkg/machinery/gendata/data/username && \
    echo -n ${REGISTRY} > pkg/machinery/gendata/data/registry && \
    echo -n ${PKGS} > pkg/machinery/gendata/data/pkgs && \
    echo -n ${TOOLS} > pkg/machinery/gendata/data/tools && \
    echo -n ${TAG} > pkg/machinery/gendata/data/tag && \
    echo -n ${ARTIFACTS} > pkg/machinery/gendata/data/artifacts

FROM scratch AS embed
COPY --from=embed-generate /src/pkg/machinery/gendata/data /pkg/machinery/gendata/data

FROM embed-generate AS embed-abbrev-generate
ARG ABBREV_TAG
RUN echo -n "undefined" > pkg/machinery/gendata/data/sha && \
    echo -n ${ABBREV_TAG} > pkg/machinery/gendata/data/tag
RUN mkdir -p _out && \
    echo PKGS=${PKGS} >> _out/talos-metadata && \
    echo TOOLS=${TOOLS} >> _out/talos-metadata && \
    echo TAG=${TAG} >> _out/talos-metadata

FROM scratch AS embed-abbrev
COPY --from=embed-abbrev-generate /src/pkg/machinery/gendata/data /pkg/machinery/gendata/data
COPY --from=embed-abbrev-generate /src/_out/talos-metadata /_out/talos-metadata

FROM ${EMBED_TARGET} AS embed-target

# generate API descriptors
FROM build-go AS api-descriptors-build
WORKDIR /src/api
COPY api .
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/bufbuild/buf/cmd/buf format
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/bufbuild/buf/cmd/buf build --exclude-source-info -o lock.binpb

FROM --platform=${BUILDPLATFORM} scratch AS api-descriptors
COPY --from=api-descriptors-build /src/api/lock.binpb /api/lock.binpb

# format protobuf service definitions
FROM build-go AS proto-format-build
WORKDIR /src/api
COPY api .
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/bufbuild/buf/cmd/buf format

FROM --platform=${BUILDPLATFORM} scratch AS fmt-protobuf
COPY --from=proto-format-build /src/api/ /api/

# run docgen for machinery config
FROM build-go AS go-generate
COPY ./pkg ./pkg
COPY ./hack/boilerplate.txt ./hack/boilerplate.txt
COPY --from=embed-target / ./
RUN --mount=type=cache,target=/.cache,id=talos/.cache go generate ./pkg/...
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool golang.org/x/tools/cmd/goimports -w -local github.com/siderolabs/talos ./pkg/
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool mvdan.cc/gofumpt -w ./pkg/
WORKDIR /src/pkg/machinery
RUN --mount=type=cache,target=/.cache,id=talos/.cache go generate ./...
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/siderolabs/talos/tools/gotagsrewrite .
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool golang.org/x/tools/cmd/goimports -w -local github.com/siderolabs/talos ./
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool mvdan.cc/gofumpt -w ./

FROM go-generate AS gen-proto-go
WORKDIR /src/
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/siderolabs/talos/tools/structprotogen github.com/siderolabs/talos/pkg/machinery/... /api/resource/definitions/

# compile protobuf service definitions
FROM build-go AS generate-build
COPY --from=proto-format-build /src/api /src/api/
COPY --from=gen-proto-go /api/resource/definitions/ /src/api/resource/definitions/
WORKDIR /src/api
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/bufbuild/buf/cmd/buf build
RUN --mount=type=cache,target=/.cache,id=talos/.cache,sharing=locked go tool github.com/bufbuild/buf/cmd/buf generate
# Goimports and gofumpt generated files to adjust import order
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool golang.org/x/tools/cmd/goimports -w -local github.com/siderolabs/talos /src/api/machinery/
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool mvdan.cc/gofumpt -w /src/api/machinery/

FROM scratch AS generate-build-clean
COPY --from=generate-build /src/api /api/

FROM tools AS selinux
COPY ./internal/pkg/selinux/policy/* /selinux/
RUN mkdir /policy; secilc -o /policy/policy.33 -f /policy/file_contexts -c 33 /selinux/**/*.cil -vvvvv -O

FROM scratch AS selinux-generate
COPY --from=selinux /policy /policy

FROM scratch AS ipxe-generate
COPY --from=pkg-ipxe-riscv64 /usr/libexec/snp.efi /riscv64/snp.efi

FROM scratch AS microsoft-secureboot-database
ARG MICROSOFT_SECUREBOOT_RELEASE
ADD https://github.com/microsoft/secureboot_objects.git#${MICROSOFT_SECUREBOOT_RELEASE}:PreSignedObjects /

FROM scratch AS microsoft-key-keys
COPY --from=microsoft-secureboot-database /KEK/Certificates/*.der /kek/

FROM scratch AS microsoft-db-keys
COPY --from=microsoft-secureboot-database /DB/Certificates/MicCor*.der /db/
COPY --from=microsoft-secureboot-database /DB/Certificates/microsoft*.der /db/

FROM --platform=${BUILDPLATFORM} scratch AS generate
COPY --from=proto-format-build /src/api /api/
COPY --from=generate-build-clean /api/resource/definitions/ /api/resource/definitions/
COPY --from=generate-build-clean /api/machinery /pkg/machinery/
COPY --from=go-generate /src/pkg/imager/profile/ /pkg/imager/profile/
COPY --from=go-generate /src/pkg/machinery/resources/ /pkg/machinery/resources/
COPY --from=go-generate /src/pkg/machinery/config/schemas/ /pkg/machinery/config/schemas/
COPY --from=go-generate /src/pkg/machinery/config/types/ /pkg/machinery/config/types/
COPY --from=go-generate /src/pkg/machinery/nethelpers/ /pkg/machinery/nethelpers/
COPY --from=go-generate /src/pkg/machinery/extensions/ /pkg/machinery/extensions/
COPY --from=go-generate /src/pkg/machinery/version/os-release /pkg/machinery/version/os-release
COPY --from=ipxe-generate / /pkg/provision/providers/vm/internal/ipxe/data/ipxe/
COPY --from=selinux-generate / /internal/pkg/selinux/
COPY --from=embed-abbrev / /
COPY --from=pkg-ca-certificates /etc/ssl/certs/ca-certificates /internal/app/machined/pkg/controllers/secrets/data/
COPY --from=microsoft-key-keys / /internal/pkg/secureboot/database/certs/
COPY --from=microsoft-db-keys / /internal/pkg/secureboot/database/certs/

# The base target provides a container that can be used to build all Talos
# assets.

FROM build-go AS base
COPY ./cmd ./cmd
COPY ./pkg ./pkg
COPY ./internal ./internal
COPY --from=embed / ./
RUN --mount=type=cache,target=/.cache,id=talos/.cache go list all >/dev/null
WORKDIR /src/pkg/machinery
RUN --mount=type=cache,target=/.cache,id=talos/.cache go list all >/dev/null
RUN --mount=type=cache,target=/.cache,id=talos/.cache go generate -v ./version
WORKDIR /src

# The vulncheck target runs the vulnerability check tool.

FROM base AS lint-vulncheck
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool golang.org/x/vuln/cmd/govulncheck ./...

# The lint-deadcode target runs the deadcode elimination check.
FROM base AS lint-deadcode
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
ARG GO_MACHINED_LDFLAGS
ARG GOAMD64
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=amd64 GOAMD64=${GOAMD64} go build ${GO_BUILDFLAGS} -ldflags "${GO_LDFLAGS} ${GO_MACHINED_LDFLAGS} -dumpdep" ./internal/app/machined \
    |& go tool github.com/aarzilli/whydeadcode > deadcode.txt
RUN if [[ -s deadcode.txt ]]; then \
    echo "Dead code elimination problem found:"; \
    cat deadcode.txt; \
    exit 1; \
    else \
    echo "No dead code elimination issues found"; \
    fi

# The init target builds the init binary.

FROM base AS init-build-amd64
WORKDIR /src/internal/app/init
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=amd64 GOAMD64=v1 go build ${GO_BUILDFLAGS} -ldflags "${GO_LDFLAGS}" -o /init
RUN chmod +x /init

FROM base AS init-build-riscv64
WORKDIR /src/internal/app/init
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=riscv64 go build ${GO_BUILDFLAGS} -ldflags "${GO_LDFLAGS}" -o /init
RUN chmod +x /init

FROM init-build-${TARGETARCH} AS init-build

FROM scratch AS init
COPY --from=init-build /init /init

# The machined target builds the machined binary.

FROM base AS machined-build-riscv64
WORKDIR /src/internal/app/machined
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
ARG GO_MACHINED_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=riscv64 go build ${GO_BUILDFLAGS} -ldflags "${GO_LDFLAGS} ${GO_MACHINED_LDFLAGS}" -o /machined
RUN chmod +x /machined

FROM machined-build-${TARGETARCH} AS machined-build

FROM scratch AS machined
COPY --from=machined-build /machined /machined

# The talosctl targets build the talosctl binaries.

FROM base AS talosctl-linux-amd64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
ARG GOAMD64
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=amd64 GOAMD64=${GOAMD64} go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-linux-amd64
RUN chmod +x /talosctl-linux-amd64
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-linux-amd64

FROM base AS talosctl-linux-arm64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=arm64 go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-linux-arm64
RUN chmod +x /talosctl-linux-arm64
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-linux-arm64

FROM base AS talosctl-linux-armv7-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=arm GOARM=7 go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-linux-armv7
RUN chmod +x /talosctl-linux-armv7
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-linux-armv7

FROM base AS talosctl-darwin-amd64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
ARG GOAMD64
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=darwin GOARCH=amd64 GOAMD64=${GOAMD64} go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-darwin-amd64
RUN chmod +x /talosctl-darwin-amd64
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-darwin-amd64

FROM base AS talosctl-darwin-arm64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=darwin GOARCH=arm64 go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-darwin-arm64
RUN chmod +x /talosctl-darwin-arm64
RUN touch --date="@${SOURCE_DATE_EPOCH}" talosctl-darwin-arm64

FROM base AS talosctl-windows-amd64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
ARG GOAMD64
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=windows GOARCH=amd64 GOAMD64=${GOAMD64} go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-windows-amd64.exe
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-windows-amd64.exe

FROM base AS talosctl-windows-arm64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=windows GOARCH=arm64 go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-windows-arm64.exe
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-windows-arm64.exe

FROM base AS talosctl-freebsd-amd64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
ARG GOAMD64
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=freebsd GOARCH=amd64 GOAMD64=${GOAMD64} go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-freebsd-amd64
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-freebsd-amd64

FROM base AS talosctl-freebsd-arm64-build
WORKDIR /src/cmd/talosctl
ARG GO_BUILDFLAGS_TALOSCTL
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=freebsd GOARCH=arm64 go build ${GO_BUILDFLAGS_TALOSCTL} -ldflags "${GO_LDFLAGS}" -o /talosctl-freebsd-arm64
RUN touch --date="@${SOURCE_DATE_EPOCH}" /talosctl-freebsd-arm64

FROM scratch AS talosctl-linux-amd64
COPY --from=talosctl-linux-amd64-build /talosctl-linux-amd64 /talosctl-linux-amd64

FROM scratch AS talosctl-linux-arm64
COPY --from=talosctl-linux-arm64-build /talosctl-linux-arm64 /talosctl-linux-arm64

FROM scratch AS talosctl-linux-armv7
COPY --from=talosctl-linux-armv7-build /talosctl-linux-armv7 /talosctl-linux-armv7

FROM scratch AS talosctl-darwin-amd64
COPY --from=talosctl-darwin-amd64-build /talosctl-darwin-amd64 /talosctl-darwin-amd64

FROM scratch AS talosctl-darwin-arm64
COPY --from=talosctl-darwin-arm64-build /talosctl-darwin-arm64 /talosctl-darwin-arm64

FROM scratch AS talosctl-freebsd-amd64
COPY --from=talosctl-freebsd-amd64-build /talosctl-freebsd-amd64 /talosctl-freebsd-amd64

FROM scratch AS talosctl-freebsd-arm64
COPY --from=talosctl-freebsd-arm64-build /talosctl-freebsd-arm64 /talosctl-freebsd-arm64

FROM scratch AS talosctl-windows-amd64
COPY --from=talosctl-windows-amd64-build /talosctl-windows-amd64.exe /talosctl-windows-amd64.exe

FROM scratch AS talosctl-windows-arm64
COPY --from=talosctl-windows-arm64-build /talosctl-windows-arm64.exe /talosctl-windows-arm64.exe

FROM --platform=${BUILDPLATFORM} talosctl-${TARGETOS}-${TARGETARCH} AS talosctl-targetarch

FROM scratch AS talosctl-all
COPY --from=talosctl-linux-amd64 / /
COPY --from=talosctl-linux-arm64 / /
COPY --from=talosctl-linux-armv7 / /
COPY --from=talosctl-darwin-amd64 / /
COPY --from=talosctl-darwin-arm64 / /
COPY --from=talosctl-freebsd-amd64 / /
COPY --from=talosctl-freebsd-arm64 / /
COPY --from=talosctl-windows-amd64 / /
COPY --from=talosctl-windows-arm64 / /

FROM scratch AS talosctl
ARG TARGETARCH
COPY --from=talosctl-all /talosctl-linux-${TARGETARCH} /talosctl
ARG TAG
ENV VERSION=${TAG}
LABEL "alpha.talos.dev/version"="${VERSION}"
LABEL org.opencontainers.image.source=https://github.com/siderolabs/talos
ENTRYPOINT ["/talosctl"]

# The kernel target is the linux kernel.
FROM scratch AS kernel
ARG TARGETARCH
COPY --from=pkg-kernel /boot/vmlinuz /vmlinuz-${TARGETARCH}

# The sd-boot target is the systemd-boot asset.
FROM scratch AS sd-boot
ARG TARGETARCH
COPY --from=pkg-sd-boot /*.efi /sd-boot-${TARGETARCH}.efi

# The sd-stub target is the systemd-stub asset.
FROM scratch AS sd-stub
ARG TARGETARCH
COPY --from=pkg-sd-boot /*.efi.stub /sd-stub-${TARGETARCH}.efi

# all except /drivers/media and /sound
FROM tools AS depmod-riscv64
WORKDIR /staging
COPY hack/modules-riscv64.txt .
COPY --from=pkg-kernel-riscv64 /usr/lib/modules usr/lib/modules
RUN <<EOF
set -euo pipefail

KERNEL_VERSION=$(ls usr/lib/modules)

find usr/lib/modules/${KERNEL_VERSION}/kernel -name "*.ko" -exec install -D {} /build/{} \;
xargs -a modules-riscv64.txt -I {} install -D usr/lib/modules/${KERNEL_VERSION}/{} /build/usr/lib/modules/${KERNEL_VERSION}/{}

depmod -b /build/usr ${KERNEL_VERSION}
EOF

FROM scratch AS modules-riscv64
COPY --from=depmod-riscv64 /build/usr/lib/modules /usr/lib/modules

# The rootfs target provides the Talos rootfs.
FROM build AS rootfs-base-riscv64
COPY --link --from=pkg-fhs / /rootfs
COPY --link --from=pkg-apparmor-riscv64 / /rootfs
COPY --link --from=pkg-cni-stripped-riscv64 / /rootfs
COPY --link --from=pkg-flannel-cni-riscv64 / /rootfs
COPY --link --from=pkg-cryptsetup-riscv64 / /rootfs
COPY --link --exclude=usr/bin/ctr --from=pkg-containerd-riscv64 / /rootfs
COPY --link --from=pkg-dosfstools-riscv64 / /rootfs
COPY --link --from=pkg-e2fsprogs-riscv64 / /rootfs
COPY --link --exclude=usr/share --from=pkg-systemd-udevd-riscv64 / /rootfs
COPY --link --from=pkg-systemd-udevd-riscv64 /usr/share/spdx/systemd.spdx.json /rootfs/usr/share/spdx/systemd.spdx.json
COPY --link --from=pkg-libcap-riscv64 / /rootfs
COPY --link --exclude=usr/share --from=pkg-iptables-riscv64 / /rootfs
COPY --link --from=pkg-iptables-riscv64 /usr/share/spdx/iptables.spdx.json /rootfs/usr/share/spdx/iptables.spdx.json
COPY --link --from=pkg-libattr-riscv64 / /rootfs
COPY --link --from=pkg-libinih-riscv64 / /rootfs
COPY --link --from=pkg-libjson-c-riscv64 / /rootfs
COPY --link --from=pkg-libmnl-riscv64 / /rootfs
COPY --link --from=pkg-libnftnl-riscv64 / /rootfs
COPY --link --from=pkg-libpopt-riscv64 / /rootfs
COPY --link --from=pkg-liburcu-riscv64 / /rootfs
COPY --link --from=pkg-libsepol-riscv64 / /rootfs
COPY --link --from=pkg-libselinux-riscv64 / /rootfs
COPY --link --from=pkg-pcre2-riscv64 / /rootfs
COPY --link --from=pkg-openssl-riscv64 / /rootfs
COPY --link --from=pkg-lvm2-riscv64 / /rootfs
COPY --link --from=pkg-libaio-riscv64 / /rootfs
COPY --link --from=pkg-musl-riscv64 / /rootfs
COPY --link --from=pkg-nftables-riscv64 / /rootfs
COPY --link --from=pkg-runc-riscv64 / /rootfs
COPY --link --from=pkg-xfsprogs-riscv64 / /rootfs
COPY --link --from=pkg-util-linux-riscv64 /usr/lib/libblkid.* /rootfs/usr/lib/
COPY --link --from=pkg-util-linux-riscv64 /usr/lib/libuuid.* /rootfs/usr/lib/
COPY --link --from=pkg-util-linux-riscv64 /usr/lib/libmount.* /rootfs/usr/lib/
COPY --link --from=pkg-util-linux-riscv64 /usr/share/spdx/util-linux.spdx.json /rootfs/usr/share/spdx/util-linux.spdx.json
COPY --link --from=pkg-kmod-riscv64 /usr/lib/libkmod.* /rootfs/usr/lib/
COPY --link --from=pkg-kmod-riscv64 /usr/bin/kmod /rootfs/usr/bin/modprobe
COPY --link --from=pkg-kmod-riscv64 usr/share/spdx/kmod.spdx.json /rootfs/usr/share/spdx/kmod.spdx.json
COPY --link --from=modules-riscv64 /usr/lib/modules /rootfs/usr/lib/modules
COPY --link --from=machined-build-riscv64 /machined /rootfs/usr/bin/init

# this is a no-op as it copies from a scratch image when WITH_DEBUG_SHELL is not set
COPY --link --from=pkg-debug-tools-amd64 * /rootfs/

RUN <<END
    # the orderly_poweroff call by the kernel will call '/sbin/poweroff'
    ln /rootfs/usr/bin/init /rootfs/usr/bin/poweroff
    chmod +x /rootfs/usr/bin/poweroff
    # some extensions like qemu-guest agent will call '/sbin/shutdown'
    ln /rootfs/usr/bin/init /rootfs/usr/bin/shutdown
    chmod +x /rootfs/usr/bin/shutdown
    ln /rootfs/usr/bin/init /rootfs/usr/bin/dashboard
    chmod +x /rootfs/usr/bin/dashboard
END
# NB: We run the cleanup step before creating extra directories, files, and
# symlinks to avoid accidentally cleaning them up.
COPY ./hack/cleanup.sh /usr/bin/cleanup.sh
RUN <<END
    cleanup.sh /rootfs
    mkdir -pv /rootfs/{boot/EFI,etc/{iscsi,nvme,cri/conf.d/hosts},usr/lib/firmware,usr/etc,usr/local/share,usr/share/zoneinfo/Etc,mnt,system,opt,.extra}
    mkdir -pv /rootfs/{etc/kubernetes/manifests,etc/cni/net.d,etc/ssl/certs,usr/libexec/kubernetes,/usr/local/lib/kubelet/credentialproviders,etc/selinux/targeted/contexts/files}
    mkdir -pv /rootfs/opt/{containerd/bin,containerd/lib}
END
COPY --chmod=0644 hack/zoneinfo/Etc/UTC /rootfs/usr/share/zoneinfo/Etc/UTC
COPY --chmod=0644 hack/nfsmount.conf /rootfs/etc/nfsmount.conf
COPY --chmod=0644 hack/containerd.toml /rootfs/etc/containerd/config.toml
COPY --chmod=0644 hack/cri-containerd.toml /rootfs/etc/cri/containerd.toml
COPY --chmod=0644 hack/cri-plugin.part /rootfs/etc/cri/conf.d/00-base.part
COPY --chmod=0644 hack/udevd/99-default.link /rootfs/usr/lib/systemd/network/
COPY --chmod=0644 hack/udevd/90-selinux.rules /rootfs/usr/lib/udev/rules.d/
COPY --chmod=0644 hack/lvm.conf /rootfs/etc/lvm/lvm.conf
COPY --chmod=0644 --from=base /src/pkg/machinery/version/os-release /rootfs/etc/os-release
RUN <<END
    ln -s /usr/share/zoneinfo/Etc/UTC /rootfs/etc/localtime
    touch /rootfs/etc/{extensions.yaml,resolv.conf,hosts,machine-id,cri/conf.d/cri.toml,cri/conf.d/01-registries.part,cri/conf.d/20-customization.part,cri/conf.d/base-spec.json,ssl/certs/ca-certificates.crt,selinux/targeted/contexts/files/file_contexts,iscsi/initiatorname.iscsi,nvme/{hostid,hostnqn}}
    ln -s ca-certificates.crt /rootfs/etc/ssl/certs/ca-certificates
    ln -s /etc/ssl /rootfs/etc/pki
    ln -s /etc/ssl /rootfs/usr/share/ca-certificates
    ln -s /etc/ssl /rootfs/usr/local/share/ca-certificates
    ln -s /etc/ssl /rootfs/etc/ca-certificates
END


FROM build-go AS build-sbom
ARG SOURCE_DATE_EPOCH
ENV SYFT_FORMAT_SPDX_JSON_CREATED_TIME=${SOURCE_DATE_EPOCH}
ARG NAME
ARG TAG

COPY ./hack/sbom.sh /usr/bin/sbom.sh

RUN mkdir -p /tmp/sbom-src /rootfs/usr/share/spdx
RUN cp go.mod go.sum /tmp/sbom-src/

FROM build-sbom AS sbom-container-riscv64-generate
COPY --from=rootfs-base-riscv64 /rootfs/usr/share/spdx /tmp/sbom-src/
RUN --mount=type=cache,target=/.cache,id=talos/.cache sbom.sh /tmp/sbom-src/ talos-container-riscv64.spdx.json

FROM scratch AS sbom-container-riscv64
COPY --from=sbom-container-riscv64-generate /rootfs/usr/share/spdx/talos-container-riscv64.spdx.json /

FROM build-sbom AS sbom-riscv64-generate
COPY --from=rootfs-base-riscv64 /rootfs/usr/share/spdx /tmp/sbom-src/
COPY --from=pkg-kernel-riscv64 /usr/share/spdx/kernel.spdx.json /tmp/sbom-src/
RUN --mount=type=cache,target=/.cache,id=talos/.cache sbom.sh /tmp/sbom-src/ talos-riscv64.spdx.json

FROM scratch AS sbom-riscv64
COPY --from=sbom-riscv64-generate /rootfs/usr/share/spdx/talos-riscv64.spdx.json /

FROM scratch AS sbom
COPY --from=sbom-container-riscv64 / /
COPY --from=sbom-riscv64 / /

FROM sbom-container-${TARGETARCH} AS sbom-container-target

# Use an unpinned latest version, because we want to use the latest advisories
FROM ${GENERATE_VEX_PREFIX}:${GENERATE_VEX} AS talos-vex

FROM build-go AS vex-generate
ARG TAG
COPY --from=talos-vex /generate-vex /generate-vex
RUN /generate-vex gen --target-version $TAG > /talos.vex.json
# This config contains IDs of the tracked, but affected vulnerabilities.
# Once an advisory is made, the CI should go back to passing status.
RUN /generate-vex grype-config --target-version $TAG > /talos.grype.yaml

FROM scratch AS vex
COPY --from=vex-generate /talos.vex.json /talos.vex.json
COPY --from=vex-generate /talos.grype.yaml /talos.grype.yaml

FROM build-go AS grype-scan
COPY --from=sbom-riscv64 /talos-riscv64.spdx.json /talos-riscv64.spdx.json
COPY --from=vex /talos.vex.json /talos.vex.json
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool \
    github.com/anchore/grype/cmd/grype sbom:/talos-riscv64.spdx.json \
    --vex /talos.vex.json -vv 2>&1 | tee /grype-scan.log

FROM scratch AS grype-scan-result
COPY --from=grype-scan /grype-scan.log /grype-scan.log

FROM build-go AS grype-validate
COPY --from=sbom-riscv64 /talos-riscv64.spdx.json /talos-riscv64.spdx.json
COPY --from=vex /talos.vex.json /talos.vex.json
COPY --from=vex /talos.grype.yaml /talos.grype.yaml
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool \
    github.com/anchore/grype/cmd/grype sbom:/talos-riscv64.spdx.json \
    --vex /talos.vex.json -vv --fail-on negligible --config /talos.grype.yaml

FROM rootfs-base-${TARGETARCH} AS rootfs-base
RUN rm -rf /rootfs/usr/share/spdx/*
COPY --from=sbom-container-target / /rootfs/usr/share/spdx/
RUN echo "true" > /rootfs/usr/etc/in-container
RUN rm -rf /rootfs/usr/lib/modules/*
RUN find /rootfs -print0 \
    | xargs -0r touch --no-dereference --date="@${SOURCE_DATE_EPOCH}"

FROM rootfs-base-riscv64 AS rootfs-squashfs-riscv64
RUN rm -rf /rootfs/usr/share/spdx/*
COPY --from=sbom-riscv64 / /rootfs/usr/share/spdx/
ARG ZSTD_COMPRESSION_LEVEL
COPY --from=selinux-generate /policy/file_contexts /file_contexts
COPY ./hack/labeled-squashfs.sh /
RUN fakeroot /labeled-squashfs.sh /rootfs /rootfs.sqsh /file_contexts ${ZSTD_COMPRESSION_LEVEL}

FROM scratch AS squashfs-riscv64
COPY --from=rootfs-squashfs-riscv64 /rootfs.sqsh /

FROM scratch AS squashfs-amd64
COPY --from=rootfs-squashfs-amd64 /rootfs.sqsh /

FROM scratch AS rootfs
COPY --from=rootfs-base /rootfs /

# The initramfs target provides the Talos initramfs image.

FROM build AS initramfs-archive-riscv64
WORKDIR /initramfs
ARG ZSTD_COMPRESSION_LEVEL
COPY --from=squashfs-riscv64 /rootfs.sqsh .
COPY --from=init-build-riscv64 /init .
RUN find . -print0 \
    | xargs -0r touch --no-dereference --date="@${SOURCE_DATE_EPOCH}"
RUN set -o pipefail \
    && find . 2>/dev/null \
    | LC_ALL=c sort \
    | cpio --reproducible -H newc -o \
    | zstd -c -T0 -${ZSTD_COMPRESSION_LEVEL} \
    > /initramfs.xz

FROM initramfs-archive-${TARGETARCH} AS initramfs-archive

FROM scratch AS initramfs
ARG TARGETARCH
COPY --from=initramfs-archive /initramfs.xz /initramfs-${TARGETARCH}.xz

# The talos target generates a docker image that can be used to run Talos
# in containers.

FROM scratch AS talos
COPY --from=rootfs / /
LABEL org.opencontainers.image.source=https://github.com/siderolabs/talos
ENTRYPOINT ["/sbin/init"]

# The installer target generates an image that can be used to install Talos to
# various environments.

# Make the installer binary.
FROM base AS installer-build
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
WORKDIR /src/cmd/installer
ARG TARGETARCH
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=${TARGETARCH} go build ${GO_BUILDFLAGS} -ldflags "${GO_LDFLAGS}" -o /installer
RUN chmod +x /installer

# Make the images containing the boot artifacts.
FROM scratch AS install-artifacts-riscv64
COPY --from=pkg-kernel-riscv64 /boot/vmlinuz /usr/install/riscv64/vmlinuz
COPY --from=initramfs-archive-riscv64 /initramfs.xz /usr/install/riscv64/initramfs.xz
COPY --from=pkg-sd-boot-riscv64 /linuxriscv64.efi.stub /usr/install/riscv64/systemd-stub.efi
COPY --from=pkg-sd-boot-riscv64 /systemd-bootriscv64.efi /usr/install/riscv64/systemd-boot.efi
COPY --from=sbom-riscv64 /talos-riscv64.spdx.json /usr/install/riscv64/talos.spdx.json

FROM scratch AS install-artifacts-all
COPY --from=install-artifacts-riscv64 / /

FROM install-artifacts-${TARGETARCH} AS install-artifacts-targetarch

FROM install-artifacts-${INSTALLER_ARCH} AS install-artifacts

# Add the installer with a symlink as 'imager' and a /rootfs dir containing only the installer.
FROM tools AS installer-image-gen
COPY --from=installer-build /installer /rootfs/usr/bin/installer
RUN ln -s installer /rootfs/usr/bin/imager

# Add the installer binary and the tools needed to run the installer.
FROM scratch AS installer-base-image
ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH}
COPY --link --from=pkg-fhs / /
COPY --link --from=pkg-ca-certificates / /
COPY --link --exclude=**/*.a --exclude=**/*.la --exclude=usr/include --from=pkg-musl / /
COPY --link --from=pkg-dosfstools / /
COPY --link --exclude=etc/bash_completion.d --from=pkg-grub / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-libattr / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-libinih / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-liblzma / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-liburcu / /
COPY --link --from=pkg-xfsprogs / /
# Only copy the installer binary and none of the tools used for building it.
COPY --link --from=installer-image-gen /rootfs /

# Squash the installer-base-image layers to reduce size.
FROM scratch AS installer-base-image-squashed
COPY --from=installer-base-image / /

# Add metadata.
# 'installer-base' only contains the installer binary and the tools it uses.
# 'installer-base' does not contain boot assets or talos itself.
FROM installer-base-image-squashed AS installer-base
ARG TAG
ENV VERSION=${TAG}
LABEL "alpha.talos.dev/version"="${VERSION}"
LABEL org.opencontainers.image.source=https://github.com/siderolabs/talos
ENTRYPOINT ["/bin/installer"]

# Imager can be thought of as an extended installer.
# It has the boot artifacts and tools to build any requested talos image with desired modifications and system extensions.
# Imager is meant to be run outside of talos and the talos installation flow.
FROM installer-base-image-squashed AS imager-image
COPY --link --from=pkg-cpio / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/lib/pkgconfig --from=pkg-e2fsprogs / /
COPY --link --exclude=**/*.a --exclude=**/*.la --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-glib / /
COPY --link --from=pkg-grub-riscv64 /usr/lib/grub /usr/lib/grub
COPY --link --exclude=usr/include --exclude=usr/lib/pkgconfig --exclude=usr/share/pkgconfig --exclude=usr/share/bash-completion --from=pkg-kmod / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-libburn / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-libisoburn / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-libisofs / /
COPY --link --from=pkg-mtools / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --exclude=usr/lib/cmake --from=pkg-openssl / /
COPY --link --from=pkg-open-vmdk / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-pcre2 / /
COPY --link --from=pkg-pigz / /
COPY --link --from=pkg-qemu-tools / /
COPY --link --from=pkg-squashfs-tools / /
COPY --link --from=pkg-tar / /
COPY --link --exclude=**/*.a --exclude=*.a --from=pkg-util-linux-riscv64 /usr/lib/libblkid.* /usr/lib/
COPY --link --exclude=**/*.a --exclude=*.a --from=pkg-util-linux-riscv64 /usr/lib/libuuid.* /usr/lib/
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-xz / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-zlib / /
COPY --link --exclude=**/*.a --exclude=**/*.la  --exclude=usr/include --exclude=usr/lib/pkgconfig --from=pkg-zstd / /
COPY --chmod=0644 hack/extra-modules.conf /etc/modules.d/10-extra-modules.conf
COPY --from=install-artifacts / /

FROM scratch AS imager-image-squashed
COPY --from=imager-image / /

FROM imager-image-squashed AS imager
ARG TAG
ENV VERSION=${TAG}
LABEL "alpha.talos.dev/version"="${VERSION}"
LABEL org.opencontainers.image.source=https://github.com/siderolabs/talos
ENTRYPOINT ["/bin/imager"]

FROM imager AS iso-amd64-build
ARG SOURCE_DATE_EPOCH
ENV SOURCE_DATE_EPOCH=${SOURCE_DATE_EPOCH}
RUN /bin/installer \
    iso \
    --arch amd64 \
    --output /out

FROM imager AS iso-riscv64-build
ARG SOURCE_DATE_EPOCH
ENV SOURCE_DATE_EPOCH=${SOURCE_DATE_EPOCH}
RUN /bin/installer \
    iso \
    --arch riscv64 \
    --output /out

FROM scratch AS iso-amd64
COPY --from=iso-amd64-build /out /

FROM scratch AS iso-riscv64
COPY --from=iso-riscv64-build /out /

FROM --platform=${BUILDPLATFORM} iso-${TARGETARCH} AS iso

# The test target performs tests on the source code.
FROM base AS unit-tests-runner
COPY --from=rootfs / /
COPY --from=pkg-ca-certificates / /
ARG TESTPKGS
ENV PLATFORM=container
ARG GO_LDFLAGS
RUN --security=insecure --mount=type=cache,id=testspace,target=/tmp --mount=type=cache,target=/.cache,id=talos/.cache go test \
    -ldflags "${GO_LDFLAGS}" \
    -covermode=atomic -coverprofile=coverage.txt -coverpkg=${TESTPKGS} -p 4 ${TESTPKGS}
FROM scratch AS unit-tests
COPY --from=unit-tests-runner /src/coverage.txt /coverage.txt

# The unit-tests-race target performs tests with race detector.

FROM base AS unit-tests-race
COPY --from=rootfs / /
COPY --from=pkg-ca-certificates / /
ARG TESTPKGS
ENV PLATFORM=container
ENV CGO_ENABLED=1
ARG GO_LDFLAGS
RUN --security=insecure --mount=type=cache,id=testspace,target=/tmp --mount=type=cache,target=/.cache,id=talos/.cache go test \
    -ldflags "${GO_LDFLAGS}" \
    -race -p 4 ${TESTPKGS}

# The unit-tests-fips target performs tests with FIPS strict mode.
FROM base AS unit-tests-fips
COPY --from=rootfs / /
COPY --from=pkg-ca-certificates / /
ARG TESTPKGS
ENV PLATFORM=container
ENV GOFIPS140=latest
ENV GODEBUG=fips140=only,tlsmlkem=0
ARG GO_LDFLAGS
RUN --security=insecure --mount=type=cache,id=testspace,target=/tmp --mount=type=cache,target=/.cache,id=talos/.cache go test \
    -ldflags "${GO_LDFLAGS}" \
    -p 4 ${TESTPKGS}

# The integration-test targets builds integration test binary.

FROM base AS integration-test-linux-amd64-build
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
ARG GOAMD64
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=amd64 GOAMD64=${GOAMD64} go test -v -c ${GO_BUILDFLAGS} \
    -ldflags "${GO_LDFLAGS}" \
    -tags integration,integration_api,integration_cli,integration_k8s \
    ./internal/integration

FROM scratch AS integration-test-linux-amd64
COPY --from=integration-test-linux-amd64-build /src/integration.test /integration-test-linux-amd64

FROM base AS integration-test-linux-riscv64-build
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=riscv64 go test -v -c ${GO_BUILDFLAGS} \
    -ldflags "${GO_LDFLAGS}" \
    -tags integration,integration_api,integration_cli,integration_k8s \
    ./internal/integration

FROM scratch AS integration-test-linux-riscv64
COPY --from=integration-test-linux-riscv64-build /src/integration.test /integration-test-linux-riscv64

FROM base AS integration-test-darwin-arm64-build
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=darwin GOARCH=arm64 go test -v -c ${GO_BUILDFLAGS} \
    -ldflags "${GO_LDFLAGS}" \
    -tags integration,integration_api,integration_cli,integration_k8s \
    ./internal/integration

FROM scratch AS integration-test-darwin-arm64
COPY --from=integration-test-darwin-arm64-build /src/integration.test /integration-test-darwin-arm64

FROM --platform=${BUILDPLATFORM} integration-test-${TARGETOS}-${TARGETARCH} AS integration-test-targetarch

# The integration-test-provision target builds integration test binary with provisioning tests.

FROM base AS integration-test-provision-linux-build
ARG GO_BUILDFLAGS
ARG GO_LDFLAGS
ARG GOAMD64
RUN --mount=type=cache,target=/.cache,id=talos/.cache GOOS=linux GOARCH=amd64 GOAMD64=${GOAMD64} go test -v -c ${GO_BUILDFLAGS} \
    -ldflags "${GO_LDFLAGS}" \
    -tags integration,integration_provision \
    ./internal/integration

FROM scratch AS integration-test-provision-linux
COPY --from=integration-test-provision-linux-build /src/integration.test /integration-test-provision-linux-amd64

# The lint target performs linting on the source code.
FROM base AS lint-go
COPY .golangci.yml .
ENV GOGC=50
ENV GOLANGCI_LINT_CACHE=/.cache/lint
RUN --mount=type=cache,target=/.cache,id=talos/.cache,sharing=locked go tool github.com/golangci/golangci-lint/v2/cmd/golangci-lint config verify --config .golangci.yml
RUN --mount=type=cache,target=/.cache,id=talos/.cache,sharing=locked go tool github.com/golangci/golangci-lint/v2/cmd/golangci-lint run --config .golangci.yml
WORKDIR /src/pkg/machinery
RUN --mount=type=cache,target=/.cache,id=talos/.cache,sharing=locked go tool github.com/golangci/golangci-lint/v2/cmd/golangci-lint run --config ../../.golangci.yml
COPY ./hack/cloud-image-uploader /src/hack/cloud-image-uploader
WORKDIR /src/hack/cloud-image-uploader
RUN --mount=type=cache,target=/.cache,id=talos/.cache,sharing=locked go tool github.com/golangci/golangci-lint/v2/cmd/golangci-lint run --config ../../.golangci.yml
WORKDIR /src
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/siderolabs/importvet/cmd/importvet github.com/siderolabs/talos/...

# The protolint target performs linting on protobuf files.

FROM base AS lint-protobuf
WORKDIR /src/api
COPY api .
COPY --from=api-descriptors /api/lock.binpb ./current.lock.binpb
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/bufbuild/buf/cmd/buf lint
RUN --mount=type=cache,target=/.cache,id=talos/.cache go tool github.com/bufbuild/buf/cmd/buf breaking current.lock.binpb --against lock.binpb

# The markdownlint target performs linting on Markdown files.

FROM oven/bun:1-alpine AS lint-markdown
ARG MARKDOWNLINTCLI_VERSION
RUN apk add --no-cache findutils
RUN bun i -g markdownlint-cli@${MARKDOWNLINTCLI_VERSION}
WORKDIR /src
COPY . .
RUN bun run --bun markdownlint \
    --ignore '**/LICENCE.md' \
    --ignore '**/CHANGELOG.md' \
    --ignore '**/CODE_OF_CONDUCT.md' \
    --ignore '**/node_modules/**' \
    --ignore '**/hack/chglog/**' \
    --ignore 'website/content/*/reference/*' \
    --ignore 'website/themes/**' \
    --disable MD045 MD056 -- \
    .

# The docs target generates documentation.

FROM base AS docs-build
ARG TARGETOS
ARG TARGETARCH
WORKDIR /src
COPY --from=talosctl-targetarch /talosctl-${TARGETOS}-${TARGETARCH} /bin/talosctl
RUN env HOME=/home/user TAG=latest /bin/talosctl docs --config /tmp/configuration \
    && env HOME=/home/user TAG=latest /bin/talosctl docs --cli /tmp
COPY ./pkg/machinery/config/schemas/*.schema.json /tmp/schemas/

FROM scratch AS proto-docs-build
COPY --from=generate-build-clean /api/docs/api.md /api.md

FROM scratch AS docs
COPY --from=docs-build /tmp/configuration/ /website/content/v1.12/reference/configuration/
COPY --from=docs-build /tmp/cli.md /website/content/v1.12/reference/
COPY --from=docs-build /tmp/schemas /website/content/v1.12/schemas/
COPY --from=proto-docs-build /api.md /website/content/v1.12/reference/

# The talosctl-cni-bundle builds the CNI bundle for talosctl.

FROM scratch AS talosctl-cni-bundle
ARG TARGETARCH
COPY --from=pkgs-talosctl-cni-bundle /opt/cni/bin/ /talosctl-cni-bundle-${TARGETARCH}/

# The go-mod-outdated target lists all outdated modules.

FROM base AS go-mod-outdated
RUN --mount=type=cache,target=/.cache,id=talos/.cache go install github.com/psampaz/go-mod-outdated@latest \
    && mv /root/go/bin/go-mod-outdated /usr/bin/go-mod-outdated
COPY ./hack/cloud-image-uploader ./hack/cloud-image-uploader
# fail always to get the output back
RUN --mount=type=cache,target=/.cache,id=talos/.cache <<EOF
    for project in pkg/machinery . hack/cloud-image-uploader; do
        echo -e "\n>>>> ${project}:" && \
        (cd "${project}" && go list -u -m -json all | go-mod-outdated -update -direct)
    done

    exit 1
EOF
