
	if ! /bin/grep -qs '/opt/os/fedora/27/dev' /proc/mounts; then
		/bin/mount -o bind /dev/ /opt/os/fedora/27/dev/
	fi

	if ! /bin/grep -qs '/opt/os/fedora/27/dev/pts' /proc/mounts; then
		/bin/mount -o bind /dev/pts /opt/os/fedora/27/dev/pts
	fi

	if ! /bin/grep -qs '/opt/os/fedora/27/proc/' /proc/mounts; then
		/bin/mount -o bind /proc/ /opt/os/fedora/27/proc/
	fi

	if ! /bin/grep -qs '/opt/os/fedora/27/sys/' /proc/mounts; then
		/bin/mount -o bind /sys/ /opt/os/fedora/27/sys/
	fi

	/bin/busybox chroot /opt/os/fedora/27 env -i \
	/usr/bin/bash


#        /bin/busybox chroot /opt/plex env -i \
#        HOME=/home \
#        LD_LIBRARY_PATH=/plex \
#        /bin/bash



	/bin/umount /opt/os/fedora/27/sys/
	/bin/umount /opt/os/fedora/27/proc/
	/bin/umount /opt/os/fedora/27/dev/pts
	/bin/umount /opt/os/fedora/27/dev/
