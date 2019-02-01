FROM i386/centos:7

ADD redhat.sh /redhat.sh

ENV EXTRA_PACKAGES="\
  OpenIPMI-devel \
  ganglia-devel \
  gpsd-devel \
  gtk2-devel \
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
  libudev-devel \
  libvirt-devel \
  libxml2-devel \
  lm_sensors-devel \
  lua-devel \
  lvm2-devel \
  mongo-c-driver-devel \
  mosquitto-devel \
  mysql-devel \
  net-snmp-devel \
  nut-devel \
  openldap-devel \
  openssl-devel \
  perl-ExtUtils-Embed \
  postgresql-devel \
  protobuf-c-devel \
  python-devel \
  qpid-proton-c-devel \
  riemann-c-client-devel \
  rrdtool-devel \
  varnish-libs-devel \
  xen-devel \
  xfsprogs-devel \
  xmms-devel \
  yajl-devel \
"

RUN /redhat.sh
