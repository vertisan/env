#!/usr/bin/bash

SENSOR=`ls /sys/devices/platform/coretemp.0/hwmon | head -n 1`
THINKFAN_CONFIG=/etc/thinkfan.conf

sed -i.bak -e "4s/hwmon[0-9]/$SENSOR/g" /etc/thinkfan.conf

systemctl restart thinkfan
