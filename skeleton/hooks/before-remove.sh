#!/bin/bash

NAME="my-test-app"

service ${NAME} stop
rm -rf /var/run/${NAME}.pid
rm -rf /var/log/${NAME}.log