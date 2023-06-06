#/bin/sh

sudo apk add terraform

sudo apk add py3-pip
sudo apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
pip install --upgrade pip
pip install azure-cli