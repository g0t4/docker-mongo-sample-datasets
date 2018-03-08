#!/bin/bash

server=$MONGO_SERVER

# import to local mongo server if MONGO_SERVER is null
is_local=false
if [ -z $MONGO_SERVER ]; then
    is_local=true
fi

if $is_local; then
    # run mongo so we can import data
    mongod &
    pid=$!
    echo "Started mongod to import data, pid: ${pid}"
    server="localhost"
fi  

if [ -z $MONGO_DATABASE ]; then
    echo MONGO_DATABASE must be set 
    exit 1;
fi

echo "Importing sample datasets into $server"

mongoimport --host $server --db $MONGO_DATABASE --collection restaurants --drop --file primer-dataset.json

if $is_local; then
    # kill and re-run mongo, so we make sure we substitute the mongod process as the container PID 1, maybe a way around this?
    kill $pid
    wait # wait for kill to go through or we'll try to launch two instances of mongod
    exec mongod --bind_ip_all
fi
