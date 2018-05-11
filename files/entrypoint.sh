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

    TESTRESULT=`cat out/rtos/doc/ctest/ctestSummary.log | grep -c "FAILED: 0"`

    if [ $TESTRESULT -eq 0 ]; then
	     exit 1
    fi
fi

exit 0
