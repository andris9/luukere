#!/bin/bash

NAME="my-test-app"
VERSION=`cd opt/${NAME} && node -e 'console.log(require("./package").version)'`

DIR=`pwd`
cd opt/$NAME
npm install
cd $DIR

mkdir -p dist
rm -rf dist/${NAME}-*.deb
fpm -s dir -t deb -n ${NAME} -v $VERSION -C . \
  -p dist/${NAME}-VERSION_ARCH.deb \
  -d "nodejs >= 0.10.0" \
  --description "My Test App" \
  --before-remove "hooks/before-remove.sh" \
  --after-install "hooks/after-install.sh" \
  etc opt/my-test-app \
  && echo "Package successfully built"