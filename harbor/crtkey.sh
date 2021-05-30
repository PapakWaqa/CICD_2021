#!/bin/bash
IP=$1

[ ! -d "./keys" ] && mkdir keys && echo "created keys folder" 

openssl genrsa -out keys/ca.key 4096

openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=TW/ST=Taiwan/L=Taipei/O=bigred/OU=bigred/CN=$IP/emailAddress=bigred@testca.com" \
 -key keys/ca.key \
 -out keys/ca.crt


openssl genrsa -out keys/$IP.key 4096


openssl req -sha512 -new \
    -subj "/C=TW/ST=Taiwan/L=Taipei/O=bigred/OU=bigred/CN=$IP/emailAddress=bigred@testca.com" \
    -key keys/$IP.key \
    -out keys/$IP.csr


echo "subjectAltName = IP:$IP" > keys/v3.ext




openssl x509 -req -sha512 -days 3650 \
    -extfile keys/v3.ext \
    -CA keys/ca.crt -CAkey keys/ca.key -CAcreateserial \
    -in  keys/$IP.csr \
    -out keys/$IP.crt

openssl x509 -inform PEM -in keys/$IP.crt -out keys/$IP.cert
