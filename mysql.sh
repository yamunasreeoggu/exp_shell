echo Disable MySQL 8 Version
dnf module disable mysql -y

echo Copy MySQL repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo Install MySQL Server
dnf install mysql-community-server -y

echo Start MySQL Service
systemctl enable mysqld
systemctl start mysqld

echo Set MySQL root Password
mysql_secure_installation --set-root-pass ExpenseApp@1