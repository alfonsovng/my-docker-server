# DOCKER

Utilitat per a muntar un servidor accessible per SSH amb docker compose.

Descarrega el projecte i executa:

    bash start.sh

Si vols reiniciar el contenidor per desfer tots els canvis, executa:

    bash reset.sh

Està muntat pel mòdul 7 de SMX, Serveis de Xarxa i per això estic provant els serveis descrits a continuació.

## SERVICE

https://github.com/asg1612/docker-systemd

privigiled

security_opt:
      - seccomp:unconfined

invoke-rc.d: policy-rc.d denied execution of start.

    printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d

invoke-rc.d: could not determine current runlevel


## SYSLOG

https://www.rapid7.com/blog/post/2014/03/04/how-to-run-rsyslog-in-a-docker-container-for-logging/

## BIND 9

Per alguna raó, l'alies de bind9 no funciona:

    ln -s /etc/init.d/named /etc/init.d/bind9

## DHCPD

https://stackoverflow.com/a/36838530

echo "RUNLEVEL=1" >> /etc/environment

A l'hora de posar la targeta de targa a /etc/default/isc-dhcp-server, si la targeta de xarxa és diu:

    eth0@if182

s'ha de posar "eth0", sense l'arroba

## APACHE2 + PHP

Cap problema

## MARIADB

Cap problema, però s'ha d'anar en compte pq no es pot fer servir systemctl, és a dir:

    systemctl enable --now mariadb

No funciona. Cal fer-ho mitjançant la comanda service.

## VSFTPD

Cap problema

## SQUID

Cap problema
