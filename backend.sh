source common.sh
component=backend

echo Disable NodeJS 10 Version
dnf module disable nodejs -y &>>$log_file
dnf module enable nodejs:18 -y &>>$log_file

echo Install NodeJS
dnf install nodejs -y &>>$log_file

echo Copy backend Service file
cp backend.service /etc/systemd/system/backend.service &>>$log_file

echo Delete app old content
rm -rf /app &>>$log_file

echo Add Application User
useradd expense &>>$log_file

echo Create app Directory
mkdir /app &>>$log_file
cd /app &>>$log_file

download_and_extract

echo Install Dependencies
npm install &>>$log_file

echo Restart backend service
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl restart backend &>>$log_file

echo Install MySQL Client
dnf install mysql -y &>>$log_file

echo Load Schema
mysql -h mysql.yamunadevops.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file