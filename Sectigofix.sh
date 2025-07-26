#!/bin/bash

openssl s_client -connect dyndns.strato.com:443

WORKDIR="/tmp/SectigoCert"
mkdir -p "$WORKDIR"
cd "$WORKDIR" || exit 1

wget -O Sectigo_R46.crt https://raw.githubusercontent.com/faiz-network/-Sectigo-Cert/main/Sectigo_Public_Server_Authentication_Root_R46.crt
wget -O Sectigo_R46.pem https://raw.githubusercontent.com/faiz-network/-Sectigo-Cert/main/Sectigo_Public_Server_Authentication_Root_R46.pem
wget -O Sectigo_E46.crt https://raw.githubusercontent.com/faiz-network/-Sectigo-Cert/main/Sectigo_Public_Server_Authentication_Root_E46.crt
wget -O Sectigo_E46.pem https://raw.githubusercontent.com/faiz-network/-Sectigo-Cert/main/Sectigo_Public_Server_Authentication_Root_E46.pem

cp Sectigo_R46.pem /etc/ssl/certs/Sectigo_Public_Server_Authentication_Root_R46.pem
cp Sectigo_E46.pem /etc/ssl/certs/Sectigo_Public_Server_Authentication_Root_E46.pem
cp Sectigo_R46.crt /usr/share/ca-certificates/mozilla/Sectigo_Public_Server_Authentication_Root_R46.crt
cp Sectigo_E46.crt /usr/share/ca-certificates/mozilla/Sectigo_Public_Server_Authentication_Root_E46.crt

cd /etc/ssl/certs/ && c_rehash

rm -rf "$WORKDIR"

openssl s_client -connect dyndns.strato.com:443
