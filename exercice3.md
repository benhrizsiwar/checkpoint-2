# question 1
le matériel A est  un commutateur (switch) 
Son rôle permet aux ordinateurs de communiquer localement en fonction de leurs adresses MAC et un pont pour les connexions Ethernet au sein du même réseau.
# question 2
Le matériel B est un routeur 
Son rôle pour le réseau 10.10.0.0/16 :
- Il assure la passerelle entre les sous-réseaux et atteindre d'autres réseaux
- ausi une passerelle par défaut vu que a une autre interface
# question 3
f0/0 : Interface FastEthernet 0/0 → 100 Mbps.
g1/0 : Interface GigabitEthernet 1/0 → 1 Gbps.
# question 4
Le /16 CIDR signifie que le masque de sous-réseau est 255.255.0.0, donc Le réseau est 10.10.0.0/16.
# question 5
C'est l'adresse de passerelle par défaut.
# question 6
| PC   | Adresse IP       | Masque         | Adresse Réseau | Première Adresse  | Dernière Adresse   | Adresse de Diffusion |
|------|----------------- |----------------|--------------- |------------------ |------------------  |----------------------|
| PC1  | 10.10.4.1/16     | 255.255.0.0    | 10.10.0.0      | 10.10.0.1         | 10.10.255.254      | 10.10.255.255        |
| PC2  | 10.11.80.2/16    | 255.255.0.0    | 10.11.0.0      | 10.11.0.1         | 10.11.255.254      | 10.11.255.255        |
| PC5  | 10.10.4.7/15     | 255.254.0.0    | 10.10.0.0      | 10.10.0.1         | 10.11.255.254      | 10.11.255.255        |

# question 7
- PC1, PC3, PC4 et PC5 peuvent communiquer directement.
- PC2 peut parler avec PC5, mais pas avec PC1 ou PC3 sans passer par un routeur.
# question 8
Tous les PC qui ont 10.10.255.254 comme passerelle peuvent potentiellement y accéder.
Donc, PC1, PC3, PC4 et PC5 (réseau 10.10.0.0/16 et 10.10.0.0/15) peuvent l’atteindre vu que B a un routeur
# question 9 
Cela pourrait bloquer la communication de ces PC avec d'autres.
# question 10
-configuration DHCP 
-mettre une plage d’adresses dans le DHCP 
-Définir une passerelle par défaut (10.10.255.254).
-Activer DHCP sur les PC (Obtenir une adresse IP automatiquement).
-ipconfig /all pour voir l'adresse attribué


















_




