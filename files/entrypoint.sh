#!/bin/sh -

git clone --recursive https://github.com/ciaa/Firmware.git
cd Firmware
cd modules/rtos
git checkout master
cd ../..

cp ../Makefile.mine .

if [ $# -eq 0 ]; then
    /bin/bash
else
    make $@
fi
