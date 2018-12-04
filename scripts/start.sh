#!/bin/bash

mysqlhost=${mysqlhost}
mysqlusername=${mysqlusername}
mysqlpassword=${mysqlpassword}

cp /root/config/* /usr/local/content/tomcat/apache-tomcat-8.0.23/conf/

sed -i "s/@mysqlhost@/$mysqlhost/g"  /usr/local/content/tomcat/apache-tomcat-8.0.23/conf/server.xml
sed -i "s/@mysqlusername@/$mysqlusername/g"  /usr/local/content/tomcat/apache-tomcat-8.0.23/conf/server.xml
sed -i "s/@mysqlpassword@/$mysqlpassword/g"  /usr/local/content/tomcat/apache-tomcat-8.0.23/conf/server.xml


/usr/local/content/tomcat/apache-tomcat-8.0.23/bin/catalina.sh run


