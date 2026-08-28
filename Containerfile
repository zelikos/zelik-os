ARG BASE_IMAGE="ghcr.io/bootcrew/arch-bootc"

# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY /build_files /build_files
COPY /system_files /system_files

FROM ${BASE_IMAGE}:latest-amd64 as zelik-os

# Zelik OS image info
ARG ZELIKOS_PRETTY_NAME="Zelik OS"
ARG IMAGE_NAME="zelik-os"
ARG ZELIKOS_IMAGE_TAG="latest"
ARG IMAGE_VENDOR="zelikos"

### MODIFICATIONS
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build.sh

# initramfs
RUN --mount=type=tmpfs,dst=/tmp --mount=type=tmpfs,dst=/root \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build_files/shared/01-initramfs.sh

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
