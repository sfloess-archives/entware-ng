#!/opt/bin/bash 

if [ $# -lt 1 ]
then
	echo
	echo "Must provide a user name!"
	echo
	exit 1
fi

/bin/mount -o bind /opt/etc /etc

useradd $1

/opt/lib/yp/ypinit -m

/bin/umount /etc

