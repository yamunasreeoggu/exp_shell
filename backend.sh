source common.sh
component=backend

echo Disable NodeJS 10 Version
dnf module disable nodejs -y &>>$log_file
dnf module enable nodejs:18 -y &>>$log_file
status_check

echo Install NodeJS
dnf install nodejs -y &>>$log_file
status_check

echo Copy backend Service file
cp backend.service /etc/systemd/system/backend.service &>>$log_file
status_check

echo Delete app old content
rm -rf /app &>>$log_file
status_check

echo Add Application User
id expense &>>$log_file
if [ $? -ne 0 ]; then
  useradd expense &>>$log_file
fi
status_check

echo Create app Directory
mkdir /app &>>$log_file
cd /app &>>$log_file
status_check

download_and_extract
status_check

echo Install Dependencies
npm install &>>$log_file
status_check

echo Restart backend service
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl restart backend &>>$log_file
status_check

echo Install MySQL Client
dnf install mysql -y &>>$log_file
status_check

echo Load Schema
mysql -h mysql.yamunadevops.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
status_check