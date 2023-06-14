# QEMU

Documentació general: https://en.wikibooks.org/wiki/QEMU/Networking

## Instal·lació

sudo apt install qemu-system-x86 

## Descarregar una imatge

https://docs.openstack.org/image-guide/obtain-images.html#ubuntu

## Canviar el password de la imatge Ubuntu

sudo virt-customize -a bionic-server-cloudimg-amd64.img --root-password password:patata

## Iniciar la imatge amb interfície gràfica

qemu-system-x86_64 -cpu host -enable-kvm -hda jammy-server-cloudimg-amd64.img -m 512 

## NAT amb qemu

https://felipec.wordpress.com/2009/12/27/setting-up-qemu-with-a-nat/

https://slavik.svyrydiuk.eu/qemu-guest-network-in-nat-mode.html

Find main interface: 

https://serverfault.com/a/1000526

    main_interface=$(ip route get 8.8.8.8 | awk -- '{printf $5}')


qemu-system-x86_64 -cpu host -enable-kvm -net nic,model=virtio,macaddr=00:00:00:00:00:01 -net tap,ifname=docker0,script=no,downscript=no -hda jammy-server-cloudimg-amd64.img -m 512 

Amb dues targetes:

qemu-system-x86_64 -cpu host -enable-kvm -net nic -net user -net nic,model=virtio,macaddr=00:00:00:00:00:01 -net tap,ifname=tap0,script=no,downscript=no -hda jammy-server-cloudimg-amd64.img -m 512

Sense interfície gràfica:

## Sense interfície gràfica, per consola directament

qemu-system-x86_64 -cpu host -enable-kvm -nographic -hda jammy-server-cloudimg-amd64.img -m 512