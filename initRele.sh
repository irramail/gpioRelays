#!/bin/sh
#@reboot         root    /home/uid0001/scripts/initRele.sh

gpioPins="7 8 9 10 11 17 22 27"

for id in $gpioPins
do
  echo "$id" > /sys/class/gpio/export
  echo "out" > /sys/class/gpio/gpio$id/direction
done

/home/uid0001/scripts/rele.sh
