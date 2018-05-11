#!/bin/sh -

if [ $# -eq 0 ]; then
    /bin/bash
else
    make $@
fi
