[anderson@charizard: ~]$ sudo fdisk /dev/sdc

Bem-vindo ao fdisk (util-linux 2.33.1).
As alterações permanecerão apenas na memória, até que você decida gravá-las.
Tenha cuidado antes de usar o comando de gravação.


Comando (m para ajuda): m

Ajuda:

  DOS (MBR)
   a   alterna a opção de inicialização
   b   edita o rótulo do disco BSD aninhado
   c   alterna a opção "compatibilidade"

  Genérico
   d   exclui uma partição
   F   lista partições não particionadas livres
   l   lista os tipos de partições conhecidas
   n   adiciona uma nova partição
   p   mostra a tabela de partição
   t   altera o tipo da partição
   v   verifica a tabela de partição
   i   mostra informação sobre uma partição

  Miscelânea
   m   mostra este menu
   u   altera as unidades das entradas mostradas
   x   funcionalidade adicional (somente para usuários avançados)

  Script
   I   carrega layout de disco de um arquivo script de sfdisk
   O   despeja layout de disco para um arquivo script de sfdisk

  Salvar & sair
   w   grava a tabela no disco e sai
   q   sai sem salvar as alterações

  Cria um novo rótulo
   g   cria uma nova tabela de partição GPT vazia
   G   cria uma nova tabela de partição SGI (IRIX) vazia
   o   cria uma nova tabela de partição DOS vazia
   s   cria uma nova tabela de partição Sun vazia


Comando (m para ajuda): d
Selecionou a partição 1
A partição 1 foi excluída.

Comando (m para ajuda): o
Criado um novo rótulo de disco DOS com o identificador de disco 0x540211ee.

Comando (m para ajuda): n
Tipo da partição
   p   primária (0 primárias, 0 estendidas, 4 livre)
   e   estendida (recipiente para partições lógicas)
Selecione (padrão p): p
Número da partição (1-4, padrão 1): 1
Primeiro setor (2048-15130623, padrão 2048): 
Último setor, +/-setores ou +/-tamanho{K,M,G,T,P} (2048-15130623, padrão 15130623): 

Criada uma nova partição 1 do tipo "Linux" e de tamanho 7,2 GiB.
Partição nº 1: contém uma assinatura de vfat.

Deseja remover a assinatura? [S]im/[N]ão: s

A assinatura será removida por um comando de escrita.

Comando (m para ajuda): w
A tabela de partição foi alterada.
Chamando ioctl() para reler tabela de partição.
Sincronizando discos.

[anderson@charizard: ~]$ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 223,6G  0 disk 
├─sda1   8:1    0    28G  0 part /
├─sda2   8:2    0     1K  0 part 
├─sda5   8:5    0     7G  0 part [SWAP]
└─sda6   8:6    0 188,7G  0 part /home
sdb      8:16   0 931,5G  0 disk 
└─sdb1   8:17   0 931,5G  0 part /media/hd-externo
sdc      8:32   1   7,2G  0 disk 
└─sdc1   8:33   1   7,2G  0 part 
sr0     11:0    1  1024M  0 rom  
[anderson@charizard: ~]$ sudo mkfs.vfat /dev/sdc1
mkfs.fat 4.1 (2017-01-24)
[anderson@charizard: ~]$ 

