FROM debian:bullseye-slim

LABEL maintainer="buluma <ops@buluma.me.ke>"

RUN	apt-get update && apt-get install -y \
	bridge-utils \
	ca-certificates \
	curl \
	gcc \
	libxslt-dev \
	libxml2-dev \
	libvirt0 \
	libvirt-dev \
	make \
	pkg-config \
	qemu-kvm \
	ruby-dev \
	ssh \
	zlib1g-dev \
	--no-install-recommends \
	&& ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
	&& rm -rf /var/lib/apt/lists/*

ENV	VAGRANT_VERSION 2.2.19

# download the source
RUN curl -sSL "https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb" -o /tmp/vagrant-amd64.deb \
	&& dpkg -i /tmp/vagrant-amd64.deb \
	&& rm -rf /tmp/*.deb

# install the libvirt plugin
# RUN vagrant plugin install vagrant-libvirt
RUN CFLAGS="-I/opt/vagrant/embedded/include/ruby-3.0.0/ruby" vagrant plugin install vagrant-libvirt

ENTRYPOINT [ "vagrant" ]
