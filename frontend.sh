set-hostname frontend

dnf install nginx -y

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

copy expense.conf /etc/nginx/default.d/expense.conf

systemctl enable nginx
systemctl restart nginx