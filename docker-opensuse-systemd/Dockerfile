FROM opensuse/leap:15.4

LABEL maintainer="Michael Buluma"

ENV container=docker

# RUN zypper install -y dbus-1=1.12.2-8.11.2.x86_64 systemd-sysvinit=249.7-150400.1.8.x86_64 && zypper clean && \
RUN zypper install -y dbus-1 systemd-sysvinit && zypper clean && \
    cd /usr/lib/systemd/system/sysinit.target.wants/ || exit ; \
    for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done ; \
    rm -f /usr/lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /usr/lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /usr/lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /usr/lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /usr/lib/systemd/system/basic.target.wants/* ; \
    rm -f /usr/lib/systemd/system/anaconda.target.wants/*

VOLUME ["/sys/fs/cgroup"]

CMD ["/sbin/init"]
