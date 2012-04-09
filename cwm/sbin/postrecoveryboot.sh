#!/sbin/sh

# Kill not needed processes
recoverypid=`busybox ps |grep /system/bin/recovery |grep root |awk {'print $1'}`
busybox kill -9 $recoverypid

/sbin/setprop ctl.stop console
# added 5/27/2011
consolepid=`busybox ps |grep /system/bin/sh |grep -v grep |awk {'print $1'}`
busybox kill -9 $consolepid

umount /system
umount /efs
rm /etc
mkdir -p /etc
mkdir -p /datadata

if [ -L /sdcard ]
then
    rm -f sdcard
    mkdir -p /sdcard
fi

