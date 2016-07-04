FROM linuxserver/baseimage
MAINTAINER kopfpilot

# Install Plex
RUN apt-get -q update && \
apt-get install -qy wget git python python-setuptools && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Adding Custom files
COPY init/ /etc/my_init.d/
COPY etc/ /etc/
RUN chmod -v +x /etc/my_init.d/*.sh

# volumes and ports are handled by docker-plex-master