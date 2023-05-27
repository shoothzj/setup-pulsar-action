#!/bin/bash

cmd1="docker run --name pulsar -p 6650:6650 -p 8080:8080"
cmd2="-d shoothzj/pulsar:2.10.1 /pulsar/bin/pulsar standalone --no-functions-worker --no-stream-storage"

for var in "${!PULSAR_PREFIX_@}"; do
    cmd1+=" -e ${var}=${!var}"
done

final_cmd="${cmd1} ${cmd2}"

echo "Running command: $final_cmd"

eval $final_cmd
