apt install epel-release -y   #so can install nginx
apt install nginx -y
cp ./nginx.conf /etc/nginx/nginx.conf
cp ./nginx.service lib/systemd/system/nginx.service
systemctl daemon-reload
systemctl stop supervisord
systemctl disable supervisord
systemctl restart nginx
firewall-cmd --remove-port 11000-20000/tcp --permanent
firewall-cmd --remove-port 11000-20000/udp --permanent
firewall-cmd --add-port 11000-50000/tcp --permanent
firewall-cmd --add-port 11000-50000/udp --permanent
firewall-cmd --reload
