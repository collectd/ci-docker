Helper images for building collectd
===================================

Here is a collection of manifests used to build the Docker images hosted at:
<https://cloud.docker.com/u/collectd/repository/docker/collectd/ci/tags>

There is one branch per distribution/architecture pair which collectd is tested
against. Common bits are stored in the master branch, and merged into the
distro branches when needed.

Each Dockerfile contains a list of package names (mostly support libraries) to
install, and a list of plugins collectd *master* is expected to build based on
them. We want to stick to the official repositories, and only install packages
found there, to ensure collectd releases integrate smoothly in these
distributions.

Travis-CI takes care of building these images and pushing them to
cloud.docker.com. NB: Debian/sid and Fedora/rawhide built are triggered once
per day (as these distributions change constantly). You'll find the build logs
there: <https://travis-ci.org/collectd/ci-docker/builds>

The goal is to have the resulting images fit in the collectd project's CI, but
they are free to use for any other case. Only patches related to the CI will be
considered, though.

Here's an example of how you could build collectd in an Ubuntu/Xenial
environment:
```
git clone https://github.com/collectd/collectd
docker run -it --rm -v $PWD/collectd:/collectd -w /collectd collectd/ci:xenial_amd64
./build.sh && ./configure && make && make check
```
