#!/bin/bash

#用户名
username=admin
#存放文件目录
userftp=/data/ftp
#本机ip
ip_local=10.154.88.12


#卸载vsftpd
apt-get --purge remove vsftpd

#开启防火墙20，21，50000：50010端口
ufw allow 20
ufw allow 21
ufw allow proto tcp from any to any port 50000:50010
ufw reload

#安装软件
dpkg  -i   ./vsftpd_3.0.3-12kylin1_amd64.deb

#修改配置文件
cat   <  ./vsftpd.conf   >   /etc/vsftpd.conf
sed -i "s/10.154.88.10/${ip_local}/g" /etc/vsftpd.conf
sed -i "s#/data/ftp2#${userftp}#"     /etc/vsftpd.conf
mkdir /etc/vsftpd
mkdir -p /data/ftp
touch /etc/vsftpd/chroot_list




#修改ftp文件目录拥有者
chown -R ${username}:${username} ${userftp}
#修改用户家目录 
usermod -d ${userftp} ${username}


#重启ftp服务，设置开机自动启动ftp服务
systemctl start vsftpd
systemctl restart vsftpd
systemctl enable vsftpd


