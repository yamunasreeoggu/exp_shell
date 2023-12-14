echo Install Nginx
dnf install nginx -y

echo Delete Nginx default content
rm -rf /usr/share/nginx/html/*

echo Download and Extract code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo Copy Expense Conf file
cp expense.conf /etc/nginx/default.d/expense.conf

echo restart Nginx Service
systemctl enable nginx
systemctl restart nginx