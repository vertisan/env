#!/bin/bash

fanspeed() {
  if [ ! -f "/proc/acpi/ibm/fan" ]; then
    echo "!! The fan parameters are not available!";
    exit 0;
  fi

  speed=$(cat /proc/acpi/ibm/fan | grep speed | awk '{print $2; exit}')
  level=$(cat /proc/acpi/ibm/fan | grep level | awk '{print $2; exit}')

  if [ "$speed" != "" ]; then
      echo " $speed [$level]"
  else
      echo "!! Cannot get fanspeed !!"
  fi
}

fanspeed
