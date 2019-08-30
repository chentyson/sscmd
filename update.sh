cd /root/sscmd
git pull
cd /root/sscmdrun
git pull
cp /root/sscmd/superkeep.service /etc/systemd/system/
systemctl daemon-reload
systemctl restart superkeep

