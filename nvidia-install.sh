#!/bin/bash
# Este script permite instalar los drivers nvidia desde los repositorios en distribuciones basadas en Debian
# author Mirwing Rosales aka Seraph <mirwingr at gmail.com>
# License GPL-V3
# Versión 1 2012-03-25
#

if [ "$(whoami)" != 'root' ]; then
        echo "You have no permission to run $0 as non-root user."
        exit 1;
fi
echo 'Para la instalación de los drivers NVIDIA se necesitan habilitar los repositorios non-free y contrib'
echo 'Sí los tiene habilitados omita este paso en caso contrario edite los repositorios'
echo 'Desea editar el archivo de repositorios Y = si, N = no'
read repo
if [ "$repo" = "y" -o "$repo" = "Y" ]; then
	vi /etc/apt/sources.list > /dev/stdout
fi
aptitude install -y nvidia-kernel-$(uname -r) nvidia-glx nvidia-xconfig nvidia-settings > /dev/stdout
nvidia-xconfig > /dev/stdout
envi=`cat /etc/X11/default-display-manager | cut -d'/' -f4`
/etc/init.d/${envi} restart
exit 0;