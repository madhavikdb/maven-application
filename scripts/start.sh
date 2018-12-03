#!/bin/bash

mysqlhost=${mysqlhost}
mysqlusername=${mysqlusername}
mysqlpassword=${mysqlpassword}

cp /root/config/* /usr/local/content/tomcat/conf/

sed -i "s/@mysqlhost@/$mysqlhost/g"  /usr/local/content/tomcat/conf/server.xml
sed -i "s/@mysqlusername@/$mysqlusername/g"  /usr/local/content/tomcat/conf/server.xml
sed -i "s/@mysqlpassword@/$mysqlpassword/g"  /usr/local/content/tomcat/conf/server.xml


/usr/local/content/tomcat/bin/catalina.sh run


