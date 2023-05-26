#!/bin/bash

cmd1="docker run --name pulsar -p 6650:6650 -p 8080:8080"
cmd2="-d apachepulsar/pulsar:2.10.1 /pulsar/bin/pulsar standalone --no-functions-worker --no-stream-storage"

for var in "${!PULSAR_PREFIX_@}"; do
    cmd1+=" -e ${var}=${!var}"
done

docker run --name pulsar -p 6650:6650 -p 8080:8080 -d apachepulsar/pulsar:2.10.1 /pulsar/bin/pulsar standalone --no-functions-worker --no-stream-storage

final_cmd="${cmd1} ${cmd2}"
eval $final_cmd
