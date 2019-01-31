FROM centos:6

ADD redhat.sh /redhat.sh

ENV EXTRA_PACKAGES="\
  OpenIPMI-devel \
  ganglia-devel \
  hal-devel \
  hiredis-devel \
  iproute-devel \
  iptables-devel \
  java-1.7.0-openjdk-devel \
  java-devel \
  jpackage-utils \
  libatasmart-devel \
  libcap-devel \
  libcurl-devel \
  libdbi-devel \
  libesmtp-devel \
  libmemcached-devel \
  libmicrohttpd-devel \
  libmnl-devel \
  libmodbus-devel \
  libnotify-devel \
  liboping-devel \
  libpcap-devel \
  librabbitmq-devel \
  libstatgrab-devel \
  libudev-devel \
  libvirt-devel \
  libxml2-devel \
  lm_sensors-devel \
  lua-devel \
  lvm2-devel \
  mysql-devel \
  net-snmp-devel \
  nut-devel \
  openldap-devel \
  openssl-devel \
  perl-ExtUtils-Embed \
  perl-ExtUtils-MakeMaker \
  postgresql-devel \
  protobuf-c-devel \
  python-devel \
  qpid-proton-c-devel \
  rrdtool-devel \
  varnish-libs-devel \
  xen-devel \
  xfsprogs-devel \
  yajl-devel \
"

RUN /redhat.sh
