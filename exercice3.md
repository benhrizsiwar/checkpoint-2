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
# question 14 
Le protocole encapsulé dans le paquet N°2 est ARP 
Son rôle est de mapper une adresse IP à une adresse MAC, permettant aux appareils sur un réseau local de découvrir les adresses matérielles des uns et des autres.
# question 15 
Matériel A (Private_66:68:04) :
**Rôle :** A initié la requête ARP pour trouver l'adresse MAC associée à l'adresse IP 10.10.4.1.
Matériel B (Private_66:68:00) :
**Rôle :** A répondu à la requête ARP avec son adresse MAC et a participé à la communication ICMP Echo (ping) avec 10.10.4.7.
# question 16
La communication est initialisée par le périphérique avec l'adresse IP 172.16.5.253. L'adresse MAC de ce périphérique est ca:03:9e:ef:00:38.
# question 17 
Le protocole encapsulé est ICMP (Internet Control Message Protocol). Son rôle est d'envoyer des messages d'erreur et des informations opérationnelles indiquant le succès ou l'échec
# question 18 
Oui, cette communication a réussi. La requête ICMP Echo (ping) du périphérique avec l'adresse IP 172.16.5.253 (adresse MAC ca:03:9e:ef:00:38) a reçu une réponse ICMP Echo (ping) du périphérique avec l'adresse IP 10.12.2.254 (adresse MAC ca:01:da:d2:00:1c).
# question 19 
La ligne du paquet N° 2 montre une réponse ICMP Echo (ping). Elle indique que le périphérique avec l'adresse IP 10.12.2.254 répond à la requête ICMP Echo (ping) envoyée par le périphérique avec l'adresse IP 172.16.5.253
# question 20 
Matériel A (IP 172.16.5.253, adresse MAC ca:03:9e:ef:00:38) :
Rôle : A initié la communication en envoyant une requête ICMP Echo (ping).
Matériel B (IP 10.12.2.254, adresse MAC ca:01:da:d2:00:1c) :
Rôle : A répondu à la communication en envoyant une réponse ICMP Echo (ping)
# question 21
Dans cette trame ARP, on observe un message de requête ARP qui demande l'adresse MAC associée à une adresse IP.
**Matériel source :**
Nom : "Private_66:68:01"
Adresse IP : 10.11.80.2
**Matériel destination :**
Cette trame est une requête ARP envoyée en broadcast, donc elle ne cible pas un matériel spécifique mais l’ensemble du réseau.
Adresse IP demandée : 10.11.80.200
# question 22
Adresse MAC source : 00:50:79:66:68:01 (correspondant à "Private_66:68:01")
Adresse MAC destination : ff:ff:ff:ff:ff:ff (adresse de broadcast)
---> Cette trame est une requête ARP, ce qui signifie que l’hôte 10.11.80.2 cherche à connaître l’adresse MAC associée à 10.11.80.200. Il envoie donc une requête à tous les appareils du réseau (broadcast). Si un appareil possède cette IP, il répondra avec son adresse MAC.
# question 23
Cette communication a été enregistrée sur le réseau local (LAN), car le protocole ARP fonctionne uniquement à l’intérieur d’un réseau local. L’analyse de la trame montre une adresse MAC de destination en broadcast, ce qui indique qu’elle a été interceptée à un point où toutes les trames du réseau peuvent être observées (par exemple, sur un switch configuré en mode mirroring ou un hub).















_




