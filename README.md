Helper images for building collectd
===================================

Here is a collection of manifests used to build the Docker images hosted at:
<https://cloud.docker.com/u/collectd/repository/docker/collectd/ci/tags>

There is one branch per distribution/version against which collectd is tested.
Common bits, most notably GitHub Actions, are stored in the main branch, and
merged into the distro branches when needed.

Each Dockerfile contains a list of package names (mostly support libraries) to
install, and a list of plugins collectd *main* is expected to build based on
them. We want to stick to the official repositories, and only install packages
found there, to ensure collectd releases integrate smoothly in these
distributions.

GitHub Actions take care of building these images and pushing them to
`cloud.docker.com`.

NOTE: Debian unstable ("Sid") and Fedora unstable ("Rawhide") are rebuilt daily
(as these distributions change frequently).

The goal is to have the resulting images fit in the collectd project's CI, but
they are free to use for any other case.

Here's an example of how you can build collectd on Debian unstable:

```shell
git clone https://github.com/collectd/collectd
docker run -it --rm -v $PWD/collectd:/collectd -w /collectd collectd/ci:debian_unstable
./build.sh && ./configure && make all check
```
