Docker OpenSUSE Systemd
=======================

This Dockerfile can build containers capable to use systemd.

[![Opensuse](https://github.com/buluma/dockerfiles/actions/workflows/docker-opensuse-systemd.yml/badge.svg)](https://github.com/buluma/dockerfiles/actions/workflows/docker-opensuse-systemd.yml)

Branches
--------

This repository has one branche that relates to OpenSUSE a version.

|Branch |OpenSUSE Version|Docker image tag|
|-------|----------------|----------------|
|master |latest (15.1)   |latest          |

Manually starting
-----------------

```
docker run \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  buluma/opensuse
```
