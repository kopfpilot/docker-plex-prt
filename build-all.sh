#!/bin/bash -x

echo $0
echo $1

#preserve path
_path=${0%/*}

${_path}/build-master.sh
${_path}/build-slave.sh
