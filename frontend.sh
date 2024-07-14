source common.sh
rm -f /tmp/expense.log

HEADING Install Nginx
dnf install nginx -y &>>/tmp/expense.log
STAT $?