#!/bin/bash

RADICALE_HTPASSWD_DIR=/htpasswd

if [ "$1" = 'radicale' ] && [ "$(id -u)" = '0' ]; then
    chown -R radicale:radicale /htpasswd
    chmod -R 770 /htpasswd
    chown -R radicale:radicale /tmp
fi

mkdir /htpasswd/new

if [ -n $RADICALE_NUM_USERS ] && [ -n $RADICALE_HTPASSWD_DIR ]; then
    if [ $RADICALE_NUM_USERS -gt 0 ]; then
        MAX_NUM=2
        MAX_NUM=`expr $RADICALE_NUM_USERS + 1`
        count=1
        echo "Creating htpasswd for users 1-$RADICALE_NUM_USERS"
        while [ $count -lt $MAX_NUM ]
        do
            echo "user $count"
            CURR_USER="RADICALE_USER$count"
            CURR_PASS="RADICALE_PASS$count"
            if [ -n ${!CURR_USER} ] && [ -n ${!CURR_PASS} ]; then
                if [ -f ${RADICALE_HTPASSWD_DIR}/users ]; then
                    htpasswd -b -B ${RADICALE_HTPASSWD_DIR}/users ${!CURR_USER} ${!CURR_PASS}
                else
                    htpasswd -b -B -c ${RADICALE_HTPASSWD_DIR}/users ${!CURR_USER} ${!CURR_PASS}
                fi
            fi
            count=`expr $count + 1`
        done
    fi
fi

chown -R radicale:radicale /htpasswd
