FROM linuxserver/baseimage
MAINTAINER kopfpilot

ENV VERSION 0.9.16.6.1993-5089475

# Install Plex
RUN apt-get -q update && \
apt-get install -qy dbus avahi-daemon wget git python python-setuptools && \
curl -L 'https://downloads.plex.tv/plex-media-server/0.9.16.6.1993-5089475/plexmediaserver_0.9.16.6.1993-5089475_amd64.deb' -o /tmp/plexmediaserver.deb && \
dpkg -i /tmp/plexmediaserver.deb && rm -f /tmp/plexmediaserver.deb && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


#Adding Custom files
COPY init/ /etc/my_init.d/
COPY services/ /etc/service/
COPY etc/ /etc/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# Define /config in the configuration file not using environment variables
COPY plexmediaserver /defaults/plexmediaserver

# stay at a version supported by prt

#Mappings and ports
VOLUME ["/config", "/var/lib/plexmediaserver", "/usr/lib/plexmediaserver", "/opt/plex/tmp"]
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp
