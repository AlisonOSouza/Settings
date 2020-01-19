## Shell script para configuração de ferramentas básicas em servidores Linux.
## Autor: Alison Souza
## SO base: Ubuntu 18.04

## É recomendado logar como root e criar um usuário sudo antes de começar:
##    useradd -m USUARIO
##    passwd USUARIO
##    usermod -a -G sudo USUARIO
## E deletar o usuário antigo (se houver):
##    userdel -r USUARIO_ANTIGO


## Validação de permissão de root:
if ! [ $(id -u) = 0 ]; then
	echo "Este script precisa ser executado como root." >&2
	exit 1
fi


## Pasta temporária usada na instalação.
mkdir ~/_temp_
cd ~/_temp_/


echo "*********************************************************************************"
echo "**********                     Atualização Inicial                     **********"
echo "*********************************************************************************"
apt update -y
apt upgrade -y


echo "*********************************************************************************"
echo "**********                    Instalando Utilitários                   **********"
echo "*********************************************************************************"
apt install apt-transport-https \
	ca-certificates \
	software-properties-common \
	curl \
	wget \
	htop \
	vim \
	git \
	zsh -y

## Oh-My-Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"


echo "*********************************************************************************"
echo "**********                            Docker                           **********"
echo "*********************************************************************************"
## Adicionando chave GPG.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
## Adicionando repositório do Docker no sistema.
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
## Atualiza os pacotes e instala.
apt update
apt install docker-ce
## Adicionando usuário ao grupo 'docker' para não precisar usar sudo toda vez.
usermod -aG docker ${USER}


echo "*********************************************************************************"
echo "**********                    Instalação Concluída                     **********"
echo "*********************************************************************************"
## Apagando pasta temporária.
rm -rf ~/_temp_/
