#!/bin/bash

NEW_HOSTS_FILES=$(ls -l /home/mpiuser/updates/|grep "^host_" | wc -l)

find . -name "temp*" -print0 file; do
    rm $file
    cat "$file" >> /tmp/testing123    
done

#NEW_HOSTS_FILES=$(ls -l /home/mpiuser/updates/|grep "^host_" | wc -l)
