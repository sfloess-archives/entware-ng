
	if ! /bin/grep -qs '/opt/plex/dev' /proc/mounts; then
		/bin/mount -o bind /dev/ /opt/plex/dev/
	fi

	if ! /bin/grep -qs '/opt/plex/dev/pts' /proc/mounts; then
		/bin/mount -o bind /dev/pts /opt/plex/dev/pts
	fi

	if ! /bin/grep -qs '/opt/plex/proc/' /proc/mounts; then
		/bin/mount -o bind /proc/ /opt/plex/proc/
	fi

	if ! /bin/grep -qs '/opt/plex/sys/' /proc/mounts; then
		/bin/mount -o bind /sys/ /opt/plex/sys/
	fi

	if ! /bin/grep -qs '/opt/plex/home' /proc/mounts; then
		/bin/mount -o bind /opt/.plex /opt/plex/home
	fi

	/bin/mount -o bind /etc/fstab /opt/plex/etc/fstab
	/bin/mount -o bind /opt/plex/etc/filesystems /opt/plex/proc/filesystems

	/bin/busybox chroot /opt/plex env -i \
	HOME=/home \
	LD_LIBRARY_PATH=/plex \
	/bin/bash

	/bin/umount /opt/plex/sys/
	/bin/umount /opt/plex/proc/
	/bin/umount /opt/plex/dev/pts
	/bin/umount /opt/plex/dev/
	/bin/umount /opt/plex/home
	/bin/umount /opt/plex/mnt
	/bin/umount /opt/plex/etc/fstab
	/bin/umount /opt/plex/proc/filesystems

