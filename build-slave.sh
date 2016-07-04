#!/bin/bash
_path=${0%/*}
_opwd=$PWD
cd ${_path}/plex-prt-slave
docker build -t plex-prt-slave:latest .
cd ${_opwd}