FROM centos:8

ADD redhat.sh /redhat.sh
COPY /checks/*.sh /checks/

ENV EXTRA_PACKAGES="\
  OpenIPMI-devel \
  dpdk-devel \
  gpsd-devel \
  gtk2-devel \
  hiredis-devel \
  intel-cmt-cat-devel \
  iproute-devel \
  iptables-devel \
  jansson-devel \
  java-1.8.0-openjdk-devel \
  java-devel \
  jevents-devel \
  jpackage-utils \
  libatasmart-devel \
  libcap-devel \
  libcurl-devel \
  libdbi-devel \
  libesmtp-devel \
  libmemcached-devel \
  libmicrohttpd-devel \
  libmnl-devel \
  libnotify-devel \
  liboping-devel \
  libpcap-devel \
  librabbitmq-devel \
  librdkafka-devel \
  libudev-devel \
  libvirt-devel \
  libxml2-devel \
  lm_sensors-devel \
  lua-devel \
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
  python3-devel \
  qpid-proton-c-devel \
  riemann-c-client-devel \
  rrdtool-devel \
  varnish-libs-devel \
  xfsprogs-devel \
  yajl-devel \
"

ENV SUPPORTED_PLUGIN_LIST="\
  libcollectdclient \
  aggregation \
  amqp \
  amqp1 \
  apache \
  apcups \
  ascent \
  battery \
  bind \
  buddyinfo \
  capabilities \
  ceph \
  cgroups \
  check_uptime \
  chrony \
  connectivity \
  conntrack \
  contextswitch \
  cpu \
  cpufreq \
  cpusleep \
  csv \
  curl \
  curl_json \
  curl_xml \
  dbi \
  df \
  disk \
  dns \
  dpdkevents \
  dpdkstat \
  dpdk_telemetry \
  drbd \
  email \
  entropy \
  ethstat \
  exec \
  fhcount \
  filecount \
  fscache \
  gps \
  hddtemp \
  hugepages \
  infiniband \
  intel_pmu \
  intel_rdt \
  interface \
  ipc \
  ipmi \
  iptables \
  ipvs \
  irq \
  java \
  load \
  log_logstash \
  logfile \
  logparser \
  lua \
  madwifi \
  match_empty_counter \
  match_hashed \
  match_regex \
  match_timediff \
  match_value \
  mbmon \
  mcelog \
  md \
  mdevents \
  memcachec \
  memcached \
  memory \
  mqtt \
  multimeter \
  mysql \
  netlink \
  network \
  nfs \
  nginx \
  notify_desktop \
  notify_email \
  notify_nagios \
  ntpd \
  numa \
  nut \
  olsrd \
  openldap \
  openvpn \
  ovs_events \
  ovs_stats \
  pcie_errors \
  perl \
  pinba \
  ping \
  postgresql \
  powerdns \
  processes \
  protocols \
  procevent \
  python \
  redis \
  rrdcached \
  rrdtool \
  sensors \
  serial \
  smart \
  snmp \
  snmp_agent \
  statsd \
  swap \
  synproxy \
  sysevent \
  syslog \
  table \
  tail \
  tail_csv \
  target_notification \
  target_replace \
  target_scale \
  target_set \
  target_v5upgrade \
  tcpconns \
  teamspeak2 \
  ted \
  thermal \
  threshold \
  turbostat \
  ubi \
  unixsock \
  uptime \
  users \
  uuid \
  varnish \
  virt \
  vmem \
  vserver \
  wireless \
  write_graphite \
  write_http \
  write_influxdb_udp \
  write_kafka \
  write_log \
  write_mongodb \
  write_prometheus \
  write_redis \
  write_riemann \
  write_sensu \
  write_stackdriver \
  write_syslog \
  write_tsdb \
  zfs_arc \
  zookeeper \
"

# The OpsTools sig provides collectd support in centos
# The PowerTools repo is disabled by default, so needs to be enabled to get some of the required packages.
RUN dnf -y install epel-release yum-utils centos-release-opstools 'dnf-command(config-manager)' && dnf config-manager --set-enabled powertools

RUN /redhat.sh
