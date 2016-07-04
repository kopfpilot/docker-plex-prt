#!/bin/bash -x
[ ! -d /opt ] && mkdir -p /opt

cd /opt
prt_folder=Plex-Remote-Transcoder

if [ ! -d ${prt_folder} ]; then
  git clone https://github.com/wnielson/Plex-Remote-Transcoder.git
  cd ${prt_folder}
else 
  cd ${prt_folder}
  git pull
fi

# install and setup PRT
#python setup.py install

# store master ip, for clients to read 
#su abc -c "echo $(hostname -i) > ~/.prt_master_ip"

#su abc -c "prt install <<'_eof'
#$(hostname -i)
#_eof
#"

# setup ssh 
#su abc -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"
#su abc -c "cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys"

# add master node as slave
#su abc -c "prt add_host 172.0.0.1 22 abc <<'_eof'
#y
#_eof
#"

