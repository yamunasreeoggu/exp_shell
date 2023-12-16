source common.sh

echo Disable MySQL 8 Version
dnf module disable mysql -y &>>$log_file
status_check

echo Copy MySQL repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
status_check

echo Install MySQL Server
dnf install mysql-community-server -y &>>$log_file
status_check

echo Start MySQL Service
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
status_check

echo Set MySQL root Password
mysql_root_password=$1
mysql_secure_installation --set-root-pass $mysql_root_password &>>$log_file
status_check