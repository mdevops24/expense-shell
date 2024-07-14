source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ]; then
  echo "Input MySQL Password is Missing"
  exit 1
fi

HEADING Installing MySQL Server
dnf install mysql-server -y &>>/tmp/expense.log
STAT $?

HEADING Start Nginx Service
systemctl enable mysqld &>>/tmp/expense.log
systemctl start mysqld &>>/tmp/expense.log
STAT $?

HEADING Set Root Password
mysql_secure_installation --set-root-pass $1 &>>/tmp/expense.log
STAT $?
