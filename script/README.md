Scripts d'installation et de maintenance
=======================================

* install.sh: lance l'installation du projet sur une clé usb 
* chroot.sh: l'ensemble des commandes à lancer en mode chroot
* clean.sh: nettoie la distribution des fichiers et package inutile
* kernel.sh: compile le kernel 4.9.6 avec le minimum de règle
* correction.sh: monte la clé en mode chroot et de met à jour ses fichiers
* backup.sh: effectue une sauvegarde de la clé
* boot.sh: lance la clé dans Qemu

# Liste des fichiers

* busybox-x86_64: le binaire de busybox
* CONFIG_KERNEL: la configuration minimal du kernel pour la compilation
* httpd: le daemon qui lance le serveur web
* kernel/ : contient le noyau minimal pré-compilé
* lcd4linux.conf: une configuration de base pour lcd4linux
* lcddanizan.service: le service qui lance lcd4linux sur /dev/tty2
* testcgi.sh: permet de tester l'application web en mode hors-ligne
