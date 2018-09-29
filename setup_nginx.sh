yum install epel-release -y   #so can install nginx
yum install nginx -y
#cp ./nginx.conf /etc/nginx/nginx.conf
cp ./nginx.service /usr/lib/systemd/system/nginx.service
systemctl daemon-reload
#systemctl stop supervisord
#systemctl disable supervisord
#systemctl restart nginx
firewall-cmd --remove-port 11000-20000/tcp --permanent
firewall-cmd --remove-port 11000-20000/udp --permanent
firewall-cmd --add-port 11000-65000/tcp --permanent
firewall-cmd --add-port 11000-65000/udp --permanent
firewall-cmd --add-port 22/tcp --permanent
firewall-cmd --reload
firewall-cmd --list-port
