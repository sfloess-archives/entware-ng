#!/bin/sh

# --------------------------------------------------------------

sleep 65s

# --------------------------------------------------------------

#rm /tmp/etc/passwd /tmp/etc/group
#ln -s /opt/etc/passwd /tmp/etc/passwd
#ln -s /opt/etc/group /tmp/etc/group

/bin/mount -o bind /opt/etc       /tmp/etc

# --------------------------------------------------------------

mkdir -p /tmp/var/spool/mail

chmod 755 /tmp/var/spool

/bin/mount -o bind /opt/var/spool/mail /tmp/var/spool/mail

# --------------------------------------------------------------

/opt/etc/init.d/S69postfix      start
/opt/etc/init.d/S90dovecot      start
/opt/etc/init.d/S70mariadbd     start
/opt/etc/init.d/S98postgresql   start
/opt/etc/init.d/S56unfsd        start

# --------------------------------------------------------------

/opt/sbin/ypserv

# --------------------------------------------------------------

