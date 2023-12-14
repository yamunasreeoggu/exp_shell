echo Disable NodeJS 10 Version
dnf module disable nodejs -y
dnf module enable nodejs:18 -y

echo Install NodeJS
dnf install nodejs -y

echo Copy backend Service file
cp backend.service /etc/systemd/system/backend.service

echo Add Application User
useradd expense

echo Create app Directory
mkdir /app
cd /app

echo Download and Extract code
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
unzip /tmp/backend.zip

echo Install Dependencies
npm install

echo Restart backend service
systemctl daemon-reload
systemctl enable backend
systemctl restart backend

echo Install MySQL Client
dnf install mysql -y

echo Load Schema
mysql -h 172.31.45.27 -uroot -pExpenseApp@1 < /app/schema/backend.sql