#!/bin/bash

#Override default config path here. Set env NGINX_CONFIG_PATH.
CONFIG_PATH=${NGINX_CONFIG_PATH:-/etc/nginx}

#Replace variables ${EXAMPLE}
function ReplaceEnvVar() {
    grep -Rl --include="*.conf" "\${$1}" $3|xargs -r \
        sed -i "s|\\\${$1}|$2|g"
}

# Replace all variables
for _curVar in `env | awk -F = '{print $1}'`;do
    ReplaceEnvVar ${_curVar} ${!_curVar} ${CONFIG_PATH}
done

nginx -g 'daemon off;'
