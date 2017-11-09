#update limits
sed -i '/soft nofile 51200/d' /etc/security/limits.conf
sed -i '$a soft nofile 51200' /etc/security/limits.conf 
sed -i '/hard nofile 51200/d' /etc/security/limits.conf
sed -i '$a hard nofile 51200' /etc/security/limits.conf 

#setup ulimit
ulimit -n 51200

#load hybla
/sbin/modprobe tcp_hybla
sed -i '/\/sbin\/modprobe tcp_hybla/d' /etc/rc.d/rc.local
sed -i '$a \/sbin\/modprobe tcp_hybla' /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local

#update sysctl.conf
sed -i '/fs.file-max = 51200/d' /etc/sysctl.conf
sed -i '$a fs.file-max = 51200' /etc/sysctl.conf

sed -i '/net.core.wmem_max = 67108864/d' /etc/sysctl.conf
sed -i '$a net.core.wmem_max = 67108864' /etc/sysctl.conf

sed -i '/net.core.netdev_max_backlog = 250000/d' /etc/sysctl.conf
sed -i '$a net.core.netdev_max_backlog = 250000' /etc/sysctl.conf

sed -i '/net.core.somaxconn = 3240000/d' /etc/sysctl.conf
sed -i '$a net.core.somaxconn = 3240000' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_syncookies = 1/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_syncookies = 1' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_tw_reuse = 1/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_tw_reuse = 1' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_tw_recycle = 0/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_tw_recycle = 0' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_fin_timeout = 30/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_fin_timeout = 30' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_keepalive_time = 1200/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_keepalive_time = 1200' /etc/sysctl.conf

sed -i '/net.ipv4.ip_local_port_range = 10000 65000/d' /etc/sysctl.conf
sed -i '$a net.ipv4.ip_local_port_range = 10000 65000' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_max_syn_backlog = 8192/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_max_syn_backlog = 8192' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_max_tw_buckets = 5000/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_max_tw_buckets = 5000' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_fastopen = 3/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_fastopen = 3' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_rmem = 4096 87380 67108864/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_rmem = 4096 87380 67108864' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_wmem = 4096 65536 67108864/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_wmem = 4096 65536 67108864' /etc/sysctl.conf

sed -i '/net.ipv4.tcp_mtu_probing = 1/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_mtu_probing = 1' /etc/sysctl.conf
sed -i '/net.ipv4.tcp_congestion_control = hybla/d' /etc/sysctl.conf
sed -i '$a net.ipv4.tcp_congestion_control = hybla' /etc/sysctl.conf

sysctl -p

#install server-speeder
#replace centos7 kernal
#update linux-firmware
yum update
yum install linux-firmware.noarch -y
#install new kernal
rpm -ivh http://soft.91yun.org/ISO/Linux/CentOS/kernel/kernel-3.10.0-229.1.2.el7.x86_64.rpm --force

#now need reboot
read -p "Now,need to reboot! run install_speeder after reboot. ok, Press any key to reboot..." aa
reboot
