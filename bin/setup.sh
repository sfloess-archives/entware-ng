#!/bin/sh

# --------------------------------------------------------------

#/bin/umount /jffs

#/bin/mount -o bind /opt 		/jffs

# --------------------------------------------------------------

/bin/mount -o bind /opt/usr/local /usr/local

# --------------------------------------------------------------

mkdir -p /var/yp

/bin/mount -o bind /opt/var/yp          /var/yp

# --------------------------------------------------------------

cp -rf /tmp/root/.ssh /opt/nas/home/root/

/bin/mount -o bind /opt/nas/home/root       /tmp/root

# --------------------------------------------------------------

rm -rf /opt/nas/var/cache/minidlna/files.db

/usr/sbin/minidlna -f /opt/nas/etc/minidlna.conf

# --------------------------------------------------------------

/opt/bin/domainname flossware.com

# --------------------------------------------------------------

/opt/etc/init.d/S01syslog-ng start
/opt/etc/init.d/S55portmap   start
/opt/etc/init.d/S77ntpdate   start
/opt/etc/init.d/S77ntpd      start

# --------------------------------------------------------------

/opt/nas/bin/paused-setup.sh &

# --------------------------------------------------------------

