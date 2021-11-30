#!/bin/bash
# Change 192.x.x.x with your Wibee IP
energy=`curl --silent -X GET http://192.x.x.x/services/user/values.xml?var=WIBEEE.pac1 | grep -oPm1 "(?<=<value>)[^<]+"`
if [ -z "$energy" ]
then
      echo "No data - Abortings"
else
      echo $energy Watios
      #Script working on same Domoticz Hardware & Allow 127.0.0.1 without password auth on Domoticz. Change xxxxxx with your Domoticz ID Sensor - Virtal Sensor Type = Usage Electric
      curl -s -i -H "Accept: application/json" "http://127.0.0.1:xxxxx/json.htm?type=command&param=udevice&idx=xxxx&nvalue=0&svalue=$energy:$energy"

fi
