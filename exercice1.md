# question 1
ipconfig /all 
**depuis le client** ping 172.16.10.10
**depuis le serveur** ping 172.16.100.50 
----> il marche pas 
**depuis le client** changement de ip pour  etre dans le meme sous réseau : 172.16.10.50
----> ping marche 
-----
# question 2
ping Checkpoint2-CLIWIN10 ou ping Checkpoint2-SRVWIN2022 
----> ne marche pas 
**depuis le client**  C:\Windows\System32\drivers\etc\hosts    172.16.10.10 Checkpoint2-SRVWIN2022
**depuis le serveur**  C:\Windows\System32\drivers\etc\hosts  172.16.10.50 Checkpoint2-CLIWIN10
----> ping marche 
------
# question 3 
**depuis le client** configurer l'adresse automatique attribuée par DHCP netsh interface ip set address "Ethernet" dhcp
ipconfig /all
**depuis le serveur** dans gestionnaire dhcp voir le scope 172.16.10.0  et les adresses pool et les exclusions et voir si dans les adresses leases apparait l'adresse client distribué
le client ne prend pas la première adresse disponible car il ya conservation des adresses précedentes des clients tant que n'est pas utilisé ou selon l'attribution des réservations DHCP, des exclusions d’adresses ou une configuration de durée de bail
-----
# question 4
**depuis le serveur** dans gestionnaire dhcp on fait une réservation pour le client avec son adresse mac de l'adresse 172.16.10.15 et effacer les exclusions de 172.16.10.1 ET 172.16.10.15
**depuis le client** ipconfig /release     ipconfig/renew ipconfig/all 
----
