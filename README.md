# Settings
Neste repositório estão salvas configurações, informações e lembretes sobre alguns programas e S.O.'s que utilizo.


##### [Windows 10] Corrigir GRUB após instalação/atualização do Windows 10 dual boot UEFI
```
1 - Abra o prompt de comando como administrador
2 - bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
```

##### [Elementary OS] Lentidão após digitar login e senha.   
Problema causado por uma interface de Tecnologia Assistiva. Basta remover da inicialização.
```
sudo mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.disable
```

##### [Elementary OS] Computador desliga após inserir fone de ouvido:   
Problema relacionado o modo de economia de energia do Intel HD Audio, que desliga o PC quando não está carregando e conecta o fone.
```
1 - sudo gedit /etc/default/tlp
2 -  Substitua 
      SOUND_POWER_SAVE_ON_BAT=1 por 
      SOUND_POWER_SAVE_ON_BAT=0
3 - Salve
4 - sudo service tlp restart
```
