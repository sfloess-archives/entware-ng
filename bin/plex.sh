#!/bin/sh

media_dir="/opt/nas/media/Videos"


if [ -z "$media_dir" ]; then
	/bin/echo "You must set the media_dir variable"
	exit 1
fi

start() {

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

	if ! /bin/grep -qs '/opt/plex/mnt' /proc/mounts; then
		/bin/mount -o bind $media_dir /opt/plex/mnt
	fi

	/opt/.plex/tmux new-session -d -s plex '
	/bin/busybox chroot /opt/plex env -i \
	HOME=/home \
	LD_LIBRARY_PATH=/plex \
	/plex/Plex\ Media\ Server'

	}

stop() {

	/bin/kill `pidof Plex\ Media\ Server`
	sleep 5

	/bin/umount /opt/plex/sys/
	/bin/umount /opt/plex/proc/
	/bin/umount /opt/plex/dev/pts
	/bin/umount /opt/plex/dev/
	/bin/umount /opt/plex/home
	/bin/umount /opt/plex/mnt

	}



case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	*)
		/bin/echo "Usage: (start|stop)"
		exit 1
		;;
esac
echo Done.
exit 0
