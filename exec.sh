#!/bin/bash
configPath="/etc/nginx";
templatesPath="${configPath}/tmpl/";

if [[ -d "$templatesPath" ]]; then
    rm -rf ${configPath}/conf.d/default.conf;
    for f in $(find ${configPath}/tmpl/ -name '*.conf'); do
        fullPath="${f/\/tmpl/}";
        directoryPath="${fullPath%\/*}";
        if [[ ! -d "$directoryPath" ]]; then
            mkdir -p "$directoryPath";
        fi
        cp ${f} ${fullPath};

        # Replace all variables
        for _curVar in `env | awk -F = '{print $1}'`;do
            sed -i "s|\\\${${_curVar}}|${!_curVar}|g" ${fullPath}
        done
    done
fi

nginx -g 'daemon off;'
