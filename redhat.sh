#!/bin/sh -e

COMMON_PACKAGES="\
  autoconf \
  automake \
  bison \
  clang \
  cpp \
  curl \
  flex \
  gcc \
  gcc-c++ \
  gdb \
  git \
  glibc-devel \
  libgcrypt-devel \
  libtool \
  libtool-ltdl-devel \
  m4 \
  make \
  nc \
  pkgconfig \
  redhat-rpm-config \
  strace \
  tar \
  valgrind \
"

yum -y update

yum -y install $COMMON_PACKAGES $EXTRA_PACKAGES

yum -y clean all
