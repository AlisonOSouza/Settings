# Settings
Neste repositório estão salvas configurações, informações e lembretes sobre alguns programas e S.O.'s que utilizo.



```
```

```
```

[Elementary OS] Computador desliga após inserir fone de ouvido:
Problema relacionado o modo de economia de energia do Intel HD Audio, que desliga o PC quando não está carregando e conecta o fone.
SOLUÇÃO:
```
1 - sudo gedit /etc/default/tlp
2 -  Substitua 
  SOUND_POWER_SAVE_ON_BAT=1 por 
  SOUND_POWER_SAVE_ON_BAT=0
3 - sudo service tlp restart
```
