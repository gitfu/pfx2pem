#!bin/sh

# usage: sh pfx2pem.sh infile.pfx 
# output is cert.pem
 
openssl pkcs12 -in $1 -out file.nokey.pem -nokeys

openssl pkcs12 -in $1 -out file.withkey.pem

openssl rsa -in file.withkey.pem -out file.key

cat file.nokey.pem file.key > cert.pem
rm -f file.key file.nokey.pem file.withkey.pem
