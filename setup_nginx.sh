yum install epel-release -y   #so can install nginx
yum install nginx -y
cp ./nginx.conf /etc/nginx/nginx.conf
cp ./nginx.service /usr/lib/systemd/system/nginx.service
systemctl daemon-reload
systemctl stop supervisord
systemctl disable supervisord
systemctl restart nginx

