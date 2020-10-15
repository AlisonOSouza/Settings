#!/bin/bash

## Criado por Alison Souza.
## Este script contem comandos para a instalacao de algumas ferramentas
## que utilizo. Para isso, é necessario executar como root
if ! [ $(id -u) = 0 ]; then
	echo "Este script precisa ser executado como root." >&2
	exit 1
fi

# Comando pra apagar tudo que instalou.
# sudo apt purge paper-icon-theme oranchelo-icon-theme papirus-icon-theme arc-theme sublime-text code wps-office-mui-pt-br wps-office virtualbox-ext-pack virtualbox-dkms virtualbox-qt virtualbox google-chrome-stable grub-customizer elementary-tweaks terminator pinta htop gnome-system-monitor gparted gdebi software-properties-gtk software-properties-common ubuntu-restricted-extras apt-transport-https


## Para remover pacotes PPA instalados:
	## sudo add-apt-repository --remove ppa:PACKAGE

#################### Criando uma pasta para os arquivos temporarios ####################
cd
mkdir _temp_
cd _temp_/

echo "*********************************************************************************"
echo "**********                     Atualização Inicial                     **********"
echo "*********************************************************************************"
apt update -y
apt upgrade -y

echo "*********************************************************************************"
echo "**********                    Instalando Utilitários                   **********"
echo "*********************************************************************************"
apt install apt-transport-https ubuntu-restricted-extras software-properties-common software-properties-gtk net-tools gdebi git zsh vim wget htop -y

echo "*********************************************************************************"
echo "**********        Gparted, Monitor, Pinta, Terminator, Flameshot       **********"
echo "*********************************************************************************"
apt install gparted gnome-system-monitor pinta terminator flameshot -y

echo "*********************************************************************************"
echo "**********              Sublime Text e Visual Studio Code              **********"
echo "*********************************************************************************"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

apt update -y
apt install sublime-text code -y

echo "*********************************************************************************"
echo "**********                 Oh-My-Zsh e Powerline Fonts                  **********"
echo "*********************************************************************************"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
apt-get install fonts-powerline

echo "*********************************************************************************"
echo "**********                            Docker                           **********"
echo "*********************************************************************************"
# Adicionando chave GPG.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# Adicionando repositório do Docker no sistema.
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# Atualiza os pacotes e instala.
apt update
apt install docker-ce
# Adicionando usuário ao grupo 'docker' para não precisar usar sudo toda vez.
groupadd docker
usermod -aG docker ${USER}

echo "*********************************************************************************"
echo "**********   Elementary Tweaks, Grub Customizer, Remmina, FileZilla    **********"
echo "*********************************************************************************"
add-apt-repository ppa:philip.scott/elementary-tweaks
add-apt-repository ppa:danielrichter2007/grub-customizer
add-apt-repository ppa:remmina-ppa-team/remmina-next
apt update
apt install elementary-tweaks grub-customizer remmina remmina-plugin-rdp remmina-plugin-secret filezilla -y

echo "*********************************************************************************"
echo "**********                        Google Chrome                        **********"
echo "*********************************************************************************"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb -y

echo "*********************************************************************************"
echo "**********                           Discord                           **********"
echo "*********************************************************************************"
wget -O discord-0.0.1.deb https://discordapp.com/api/download?platform=linux&format=deb
apt install ./discord-0.0.1.deb -y

echo "*********************************************************************************"
echo "**********                         Virtual Box                         **********"
echo "*********************************************************************************"
apt install virtualbox virtualbox-ext-pack -y

# echo "*********************************************************************************"
# echo "**********                         WPS Office                          **********"
# echo "*********************************************************************************"
## É necessario verificar se o link abaixo esta atualizado,
## porque nao há um link generico como há para o Chrome.
# wget -O wps-office.deb http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb
# apt install ./wps-office.deb -y
## Traducao WPS para PT-BR
# wget -O wps-translation-PT_BR.deb http://download870.mediafire.com/7rscql2ipotg/36td09x94m2x4vh/wps-office-mui-pt-br_1.1.0-0kaiana1_all.deb
# apt install ./wps-translation-PT_BR.deb -y

echo "*********************************************************************************"
echo "**********        Pacotes de ícones e temas para o ElementaryOS        **********"
echo "*********************************************************************************"
# Paper icon
add-apt-repository ppa:snwh/ppa
# Oranchelo icon
add-apt-repository ppa:oranchelo/oranchelo-icon-theme
# Papirus icon
add-apt-repository ppa:papirus/papirus

apt update -y
apt install paper-icon-theme oranchelo-icon-theme papirus-icon-theme -y
# Arc Theme
apt install arc-theme -y

############################# Apagando a pasta temporaria ##############################
cd
rm -rf _temp_/

echo "*********************************************************************************"
echo "**********                    Instalação Concluída                     **********"
echo "*********************************************************************************"
