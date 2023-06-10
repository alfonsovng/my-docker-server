# my-docker-server

Utilitat per a muntar un servidor accessible per SSH amb docker compose.

Descarrega el projecte i executa:

    bash start.sh

Si vols reiniciar el contenidor per desfer tots els canvis, executa:

    bash reset.sh

## SERVICE

https://github.com/asg1612/docker-systemd

privigiled

security_opt:
      - seccomp:unconfined

invoke-rc.d: policy-rc.d denied execution of start.

    printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d

invoke-rc.d: could not determine current runlevel

## BIND 9

Per alguna raó, l'alies de bind9 no funciona:

    ln -s /etc/init.d/named /etc/init.d/bind9

## SYSLOG

https://www.rapid7.com/blog/post/2014/03/04/how-to-run-rsyslog-in-a-docker-container-for-logging/


## DHCPD

https://stackoverflow.com/a/36838530

echo "RUNLEVEL=1" >> /etc/environment

A l'hora de posar la targeta de targa a /etc/default/isc-dhcp-server, si la targeta de xarxa és diu:

    int0@if182

s'ha de posar "int0", sense l'arroba




















apt-get install bind9

systemctl enable bind9


