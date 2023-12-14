echo Install Nginx
dnf install nginx -y

echo Copy Expense Conf file
cp expense.conf /etc/nginx/default.d/expense.conf

echo Delete Nginx default content
rm -rf /usr/share/nginx/html/*

echo Download and Extract code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo Unzip files
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo restart Nginx Service
systemctl enable nginx
systemctl restart nginx