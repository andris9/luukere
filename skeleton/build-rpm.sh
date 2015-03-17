#!/bin/bash

NAME="my-test-app"
VERSION=`cd opt/${NAME} && node -e 'console.log(require("./package").version)'`

DIR=`pwd`
cd opt/$NAME
npm install
cd $DIR

mkdir -p dist
rm -rf dist/${NAME}-${VERSION}_*.rpm
fpm -s dir -t rpm -n ${NAME} -v $VERSION -C . \
  -p dist/${NAME}-VERSION_ARCH.rpm \
  -d "nodejs >= 0.10.0" \
  --description "My Test App" \
  --before-remove "hooks/before-remove.sh" \
  --after-install "hooks/after-install.sh" \
  --rpm-os linux \
  etc opt/my-test-app \
  && echo "Package successfully built"