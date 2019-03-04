# Settings
Neste repositório estão salvas configurações, informações e lembretes sobre alguns programas e S.O.'s que utilizo.

### [Windows 10]

##### Corrigir GRUB após instalação/atualização do Windows 10 dual boot UEFI
Abra o prompt de comando como administrador e execute:
```
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
```
### [Elementary OS]

##### Lentidão após digitar login e senha.   
Problema causado por uma interface de Tecnologia Assistiva. Basta remover da inicialização.
```
sudo mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.disable
```

##### Computador desliga após inserir fone de ouvido:   
Problema relacionado o modo de economia de energia do Intel HD Audio, que desliga o PC quando não está carregando e conecta o fone.
```
1 - sudo gedit /etc/default/tlp
2 - Substitua 
      SOUND_POWER_SAVE_ON_BAT=1 por 
      SOUND_POWER_SAVE_ON_BAT=0
3 - Salve
4 - sudo service tlp restart
```

##### Desativando o sincronismo de relógio no Virtual Box:
Evita que as máquinas virtuais do Virtual Box sincronizem o relógio com a máquina hospedeira. Para isso, com a VM fechada, execute o seguinte comando:
```
VBoxManage setextradata "VM name" "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled" 1
```
Para reativar o sincronismo, execute o mesmo comando com o parâmetro 0 ao invés de 1.

##### Alguns pacotes de ícones que gosto:
```
Oranchelo - https://github.com/OrancheloTeam/oranchelo-icon-theme
Paper - https://snwh.org/paper/download
Papirus - https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

Outros: https://www.edivaldobrito.com.br/melhores-pacote-de-icones-para-o-desktop-linux/
```

##### Alguns temas que gosto:
```
Adwaita - (?)
Arc-theme - https://github.com/horst3180/arc-theme (sudo apt install arc-theme)
```
