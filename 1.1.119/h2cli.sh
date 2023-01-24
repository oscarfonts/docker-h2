#!/bin/bash

CLEAR_COLOR="\e[0m"
BEGIN_WARNING_COLOR="\e[34m"

H2_CLI_USER=sa
H2_CLI_PORT=1521
H2_CLI_DATABASE=test

function printWarning {
    echo -e "${BEGIN_WARNING_COLOR}WARNING: ${CLEAR_COLOR}${1}"
}

H2_CLI_USER=sa

while [ $# -ge 1 ] 
do
    case "$1" in
        --)
            shift
            break
            ;;
        -u|--user)
            ASE="${2}"
            shift
            shift
            ;;
        -p|--port)
            #specifies h2 tcp port
            H2_CLI_PORT="${2}"
            shift
            shift
            ;;
        *)
            printWarning "Ignoring unrecognized option : '$1'"
            shift
        ;;  
    esac
done

java -cp /opt/h2/bin/h2*.jar org.h2.tools.Shell -user ${H2_CLI_USER} -url jdbc:h2:tcp://localhost:${H2_CLI_PORT}/${H2_CLI_DATABASE}