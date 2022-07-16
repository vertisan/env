#!/bin/bash

fanspeed() {
  speed=$(cat /proc/acpi/ibm/fan | grep speed | awk '{print $2; exit}')
  level=$(cat /proc/acpi/ibm/fan | grep level | awk '{print $2; exit}')

  if [ "$speed" != "" ]; then
      echo " $speed [$level]"
  else
      echo "!! Cannot get fanspeed !!"
  fi
}

fanspeed
