#!/usr/bin/env bash
MC_MEM_MX=${MC_MEM_MX:-1024M}
MC_MEM_MS=${MC_MEM_MX:-1024M}

# Set environment variables for server properties
python /tmp/env.py > /tmp/filtered.env
source /tmp/filtered.env

# Replace environment variables
cat /tmp/server.properties | envsubst > /data/server.properties

# Run the server
exec java -Xmx${MC_MEM_MX} -Xms${MC_MEM_MS} -XX:+UseG1GC -jar /server.jar -server nogui
