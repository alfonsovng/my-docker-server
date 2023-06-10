#!/bin/bash

# Comprova si ja hi ha unes "keys" generades
echo ""
echo "-----------------------------------"
echo ""
KEYS_FILE="/root/resources/ssh_host_keys.tgz"
if [ -f "${KEYS_FILE}" ]; then
    echo "Recuperant claus ssh..."
    echo ""
    tar -xvzf ${KEYS_FILE} -C /etc/ssh
else
    echo "Noves claus ssh..."
    echo ""
    tar -cvzf ${KEYS_FILE} -C /etc/ssh ssh_host_ecdsa_key ssh_host_ecdsa_key.pub ssh_host_ed25519_key ssh_host_ed25519_key.pub ssh_host_rsa_key ssh_host_rsa_key.pub
    chmod 760 ${KEYS_FILE}
fi

DEFAULT_USER=$(ls -1 /home/)
# https://unix.stackexchange.com/a/402160
IP4=$(ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')
echo ""
echo "-----------------------------------"
echo ""
echo "Ja pots connectar-te al contenidor executant: ssh ${DEFAULT_USER}@${IP4}"
echo ""
echo "Fes Ctrl+C per tancar el contenidor"
echo ""

# INICIO EL SYSLOG
rsyslogd

# executa el servei SSH
exec /usr/sbin/sshd -D
