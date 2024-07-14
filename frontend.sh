source common.sh
rm -f /tmp/expense.log

HEADING Installing Nginx
dnf install nginx -y &>>/tmp/expense.log
STAT $?

HEADING Copy expense config file
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log
STAT $?

HEADING clean old content
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
STAT $?

HEADING download frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>>/tmp/expense.log
STAT $?
cd /usr/share/nginx/html

HEADING extract content
unzip /tmp/frontend.zip &>>/tmp/expense.log
STAT $?

HEADING restart service
systemctl enable nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log
STAT $?