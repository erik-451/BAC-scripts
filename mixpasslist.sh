#!/bin/bash
## WAF Bypass para Bruteforcear Login con restricion de intentos por contraseña erronea, util en el caso de que el maximo de intentos permitidos se resetean al realizar un inicio de sesion valido.
# Altera las posiciones en una lista, se puede aplicar para el rate limit con una sesion valida entre usuario valido y no valido que sea el cual quieres bruteforcear su pass en el login.
# Puedes usar este script para crear 2 listas, 
# 1- Contiene un usuario del cual conozcas la password y con otro que sea al que quieres bruteforcear. 
# 2- La otra lista contiene la password del usuario del cual conoces su password junto a una wordlist con muchas contraseñas.

# Esto lo puedes meter al intruder alterando 1:1 las peticiones de forma que una sea valida por el inicio de sesion correcto y la otra que pruebe una password nueva usando el usuario objetivo 

### USO ###
# Usuario valido: wiener
# Contraseña valida: peter
# ./mixpasslist.sh peter rockyou.txt output.txt
cat $2 |\
while read line;
do
echo $1 >> $3
echo $line >> $3
done
