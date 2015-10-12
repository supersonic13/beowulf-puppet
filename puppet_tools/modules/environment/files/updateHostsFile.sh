#!/bin/bash

avahi-browse --all -r -t -p | egrep "^[=]" | grep "beowulf" | awk -F";" '{print $7" "$8}' | egrep "[0-9]{3}.[0-9]{3}.[0-9]+.[0-9]+" | sed 's/.local//g'> /tmp/hosts_avahi

echo "127.0.0.1 localhost" > /tmp/hosts_exports
cat /tmp/hosts_avahi | awk '{print $2" "$1}' >> /tmp/hosts_exports

cp /tmp/hosts_exports /etc/hosts

#HOSTNAME=$1
#if [[ $HOSTNAME = "beowulf-master" ]]; then
#        echo "MASTER !"
#        cp /tmp/hosts_avahi /home/mpiuser/hosts
#fi



