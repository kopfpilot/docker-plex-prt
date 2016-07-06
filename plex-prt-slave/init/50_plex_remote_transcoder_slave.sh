#!/bin/bash -x
[ ! -d /opt ] && mkdir -p /opt

cd /opt
_prt_folder=Plex-Remote-Transcoder

# determin which prt version to checkout
_version=$(dpkg -s plexmediaserver | grep Version | cut -c10-30)
if [ ${_version} \<= "0.9.16.6.1993-5089475"]; then 
  echo "less or equal"
  _use_new_prt=false
else
  echo "greater"
  _use_new_prt=true
fi

# clone or update repo
if [ ! -d ${_prt_folder} ]; then
  git clone https://github.com/wnielson/Plex-Remote-Transcoder.git
  cd ${_prt_folder}
else 
  cd ${_prt_folder}
  git pull
fi

# switch to prt version
if [ ${_use_new_prt} ]; then
  git checkout master
 else
  git checkout tag/0.2.2
fi

# install and setup PRT
python setup.py install

# fix missing shell for user abc and chown /config 
usermod -s /bin/bash abc
chown abc:root /config

# store master ip, for clients to read 
#su abc -c "echo $(hostname -i) > ~/.prt_master_ip"

su abc -c "prt install <<'_eof'
$(hostname -i)
_eof
"

# setup ssh 
#su abc -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"
#su abc -c "cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys"

# add master node as slave
su abc -c "prt add_host 172.0.0.1 22 abc <<'_eof'
y
_eof
"

