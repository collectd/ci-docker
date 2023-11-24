#!/bin/sh -e

COMMON_PACKAGES="\
  autoconf \
  automake \
  autotools-dev \
  bison \
  bzip2 \
  clang \
  cpp \
  dpkg-dev \
  flex \
  gcc \
  gdb \
  git \
  libc6-dev \
  libtool \
  linux-libc-dev \
  m4 \
  make \
  pkg-config \
  strace \
  valgrind \
"

sed -i 's/main$/main contrib non-free/' /etc/apt/sources.list

cat << EOF > /etc/apt/apt.conf.d/50misc-opts
APT::Install-Recommends "0";
APT::Install-Suggests "0";
DPkg::options { "--force-confdef"; };
EOF

export DEBIAN_FRONTEND=noninteractive

apt-get -y update

apt-get -y install $COMMON_PACKAGES $EXTRA_PACKAGES

apt-get -y clean
