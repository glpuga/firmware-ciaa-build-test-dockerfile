#
# Starting image from LTS Ubuntu 16.04
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential curl gdb git php-cli ca-certificates

WORKDIR /root

RUN git clone --recursive https://github.com/ciaa/Firmware.git \
    && cd Firmware \
    && cd modules/rtos && git checkout master

COPY files/Makefile.mine /root/Firmware
COPY files/entrypoint.sh /root

WORKDIR /root/Firmware

ENTRYPOINT ["/root/entrypoint.sh"]
