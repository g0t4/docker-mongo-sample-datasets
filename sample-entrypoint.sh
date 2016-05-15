#!/bin/bash

# run mongo so we can import data
mongod &
pid=$!
echo "Started mongod to import data, pid: ${pid}"
mongoimport --db test --collection restaurants --drop --file primer-dataset.json

# kill and re-run mongo, so we make sure we substitute the mongod process as the container PID 1, maybe a way around this?
kill $pid
wait # wait for kill to go through or we'll try to launch two instances of mongod
exec mongod

