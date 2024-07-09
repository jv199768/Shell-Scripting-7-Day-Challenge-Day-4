#!/bin/bash
echo "Enter username:"
read username
if id  "$username" >/dev/null 2>&1; then
            echo 'user exists'
    else
            echo 'user missing: execute the following commands to create and try again: sudo adduser --home /usr/local/freeswitch --shell /bin/false --no-create-home --ingroup daemon --disabled-password --disabled-login $username; chown freeswitch:daemon /usr/local/freeswitch/ -R'
fi
                                                                                                                                                                                                                                                 
