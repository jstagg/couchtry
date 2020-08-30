#!/bin/sh

MYPROC=couchdb

# Start process
/etc/init.d/$MYPROC start

# Wait for pid 
until pids=$(pidof $MYPROC)
do   
    sleep 1
done

# Import the data
curl -X PUT http://admin:wheee@localhost:5984/aliases
cat aliases.csv | couchimport --url http://admin:wheee@localhost:5984 --db aliases

# Let the container run indefinitely
mkfifo /tmp/mypipe

while read SIGNAL; do
    case "$SIGNAL" in
        *EXIT*)break;;
        *)echo "signal  $SIGNAL  is unsupported" >/dev/stderr;;
    esac
done < /tmp/mypipe