source common.sh
component=frontend

echo Install Nginx
dnf install nginx -y &>>$log_file
status_check

echo Copy Expense Conf file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
status_check

echo Delete Nginx default content
rm -rf /usr/share/nginx/html/* &>>$log_file
status_check

echo Change directory
cd /usr/share/nginx/html &>>$log_file
status_check

download_and_extract
status_check

echo restart Nginx Service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
status_check

