
FROM fedora:latest

ARG TARGETARCH

# Windows build deps
RUN dnf update
RUN dnf install ninja-build clang zip -y
RUN dnf install -y git make cmake gcc g++

ENV VCPKG_DEFAULT_TRIPLET=${TARGETARCH}-linux
ENV VCPKG_FORCE_SYSTEM_BINARIES=1
ENV VCPKG_USE_SYSTEM_BINARIES=1

RUN git clone https://github.com/microsoft/vcpkg.git
RUN cd /vcpkg && ./bootstrap-vcpkg.sh