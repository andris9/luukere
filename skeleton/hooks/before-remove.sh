#!/bin/bash

NAME="my-test-app"

initctl stop ${NAME}

rm -rf /var/run/${NAME}.pid
rm -rf /var/log/${NAME}.log