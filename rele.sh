#!/bin/sh

host=192.168.9.9
var="0"
on="0"
off="1"
gpioPins="7 8 9 10 11 17 22 27"

while :;
do
  changed=`redis-cli -h $host get changedGpio`
  if test "$changed" = "yes" ;
  then
    redis-cli -h 192.168.9.9 set changedGpio no >/dev/null 2>/dev/null

    for id in $gpioPins
    do
      gpio=`redis-cli -h $host get gpio$id`
      test "$gpio" = "1" && var=$on || var=$off
      echo $var > /sys/class/gpio/gpio$id/value
      #echo gpio$id": "$gpio" - "$var
    done
  fi
  sleep 1
done
