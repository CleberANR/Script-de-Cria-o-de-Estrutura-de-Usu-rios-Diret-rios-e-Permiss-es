#!/bin/bash

echo "Deletando pastas dos usuários..."

rm -Rf /adm/
#defina outras pastas aqui

echo "Pastas deletadas!"

echo "Excluindo usuários do sistema..."

userdel -r maisa
#defina outros usuários aqui

echo "Usuários excluídos!"

echo "Criando os diretórios com suas permissões..."

mkdir /adm -m 770
mkdir /ven -m 770
mkdir /sec -m 770
mkdir /publico -m 777

echo "Diretórios criados!"

echo "Criando os Grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados!"

echo "Criando usuários do sistema e separando em seus grupos..."
#GRUPO GRP_ADM
#cria o usuário carlos
useradd carlos -m -g GRP_ADM -p $ (openssl passwd -crypt Senha123)
passwd carlos -e

#cria o usuário maria
useradd maria -m -g GRP_ADM -p $ (openssl passwd -crypt Senha123)
passwd maria -e

#cria o usuário joão
useradd joao -m -g GRP_ADM -p $ (openssl passwd -crypt Senha123)
passwd joao -e

#GRUPO GRP_VEN
#cria o usuário debora
useradd debora -m -g GRP_VEN -p $ (openssl passwd -crypt Senha123)
passwd debora -e

#cria o usuário sebastiano
useradd sebastiano -m -g GRP_VEN -p $ (openssl passwd -crypt Senha123)
passwd sebastiano -e

#cria o usuário roberto
useradd roberto -m -g GRP_VEN -p $ (openssl passwd -crypt Senha123)
passwd roberto -e

#GRUPO GRP_SEC
#cria o usuário josefina
useradd josefina -m -g GRP_SEC -p $ (openssl passwd -crypt Senha123)
passwd josefina -e

#cria o usuário amanda
useradd amanda -m -g GRP_SEC -p $ (openssl passwd -crypt Senha123)
passwd amanda -e

#cria o usuário rogerio
useradd rogerio -m -g GRP_SEC -p $ (openssl passwd -crypt Senha123)
passwd rogerio -e

echo "Usuários criados!"

echo "Definindo o root como dono dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_ADM /ven
chown root:GRP_ADM /sec

echo "Root agora é dono dos diretórios!"

echo "Script executado com sucesso!"
