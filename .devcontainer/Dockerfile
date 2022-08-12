# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.241.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}
WORKDIR /home/vscode
RUN apt update -y && \
    apt install -y wget build-essential nasm  grub2-common xorriso \
    qemu-system-i386 grub-pc-bin dosfstools qemu-system && \
    wget https://ziglang.org/download/0.9.1/zig-linux-x86_64-0.9.1.tar.xz && \
    tar xf zig-linux-x86_64-0.9.1.tar.xz -C /usr/local/
ENV PATH $PATH:/usr/local/zig-linux-x86_64-0.9.1
