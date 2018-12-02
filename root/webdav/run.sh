#!/bin/sh

if [ $CONFIG_FILE == "default" ]; then
    echo "Use default config file"
    ./legoexec --config /webdav/default_config.yaml
else
    ./legoexec --config /webdav/${CONFIG_FILE}
fi