#!/bin/bash
_path=${0%/*}
_opwd=$PWD
cd ${_path}/plex-prt-master
docker build -t plex-prt-master:latest .
cd ${_opwd}