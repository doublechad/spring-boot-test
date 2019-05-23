#!/bin/bash
#auth chadliu
#date 20181104
# stop tomact and mv *.war to webapps
PID=$(ps -aux| grep tomcat8 | grep java | awk '{ print $2}');
sudo  kill -9 $PID
echo 'try to stop tomcat8'
sudo  rm -rf /var/lib/tomcat8/webapps/demo
sudo  rm  /var/lib/tomcat8/webapps/demo.*
sudo  mv ~/upload/*.war /var/lib/tomcat8/webapps/demo.war
echo 'try to restart tomcat8'
sleep 1
sudo  service tomcat8 start
exit 0
