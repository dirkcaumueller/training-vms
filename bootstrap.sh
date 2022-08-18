#!/bin/bash

# Update os
dnf -y -q update
dnf -y -q install langpacks-de 
dnf -y -q reinstall glibc-common
dnf -y -q clean all

# Disable SELinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# German localization
localectl set-locale LANG=de_DE.utf8
localectl set-keymap de
timedatectl set-timezone Europe/Berlin
