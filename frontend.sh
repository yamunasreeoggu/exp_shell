source common.sh
component=frontend

echo Install Nginx
dnf install nginx -y &>>$log_file

echo Copy Expense Conf file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file

echo Delete Nginx default content
rm -rf /usr/share/nginx/html/* &>>$log_file

echo Download and Extract $component code
curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip &>>$log_file

echo Unzip files
cd /usr/share/nginx/html &>>$log_file
unzip /tmp/$component.zip &>>$log_file

echo restart Nginx Service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file

