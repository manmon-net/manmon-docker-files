
mkdir -p /home/manmon-data/manmon-auth-db/
chmod 700 /home/manmon-data/manmon-auth-db/
chown 10005 /home/manmon-data/manmon-auth-db/

mkdir -p /home/manmon-data/manmon-uploader-db/
chmod 700 /home/manmon-data/manmon-uploader-db/
chown 10007 /home/manmon-data/manmon-uploader-db/

mkdir -p /home/manmon-data/manmon-auth/webapps
chmod 700 /home/manmon-data/manmon-auth/
chown 10004 /home/manmon-data/manmon-auth
chmod 700 /home/manmon-data/manmon-auth/webapps
chown 10004 /home/manmon-data/manmon-auth/webapps


mkdir -p /home/manmon-data/manmon-uploader/.auth
mkdir -p /home/manmon-data/manmon-uploader/conf
mkdir -p /home/manmon-data/manmon-uploader/webapps
chmod 700 /home/manmon-data/manmon-uploader/.auth
chmod 700 /home/manmon-data/manmon-uploader
chmod 700 /home/manmon-data/manmon-uploader/conf
chmod 700 /home/manmon-data/manmon-uploader/webapps
chown 10006 /home/manmon-data/manmon-uploader/.auth
chown 10006 /home/manmon-data/manmon-uploader/conf
chown 10006 /home/manmon-data/manmon-uploader
chown 10006 /home/manmon-data/manmon-uploader/webapps


cp -p /root/manmon/ssl/mycert.p12 /home/manmon-data/manmon-uploader/.auth/.mycert.p12
cp -p /root/manmon/ssl/cacerts.jks /home/manmon-data/manmon-uploader/.auth/.cacerts.jks
chown 10006 /home/manmon-data/manmon-uploader/.auth/.mycert.p12
chown 10006 /home/manmon-data/manmon-uploader/.auth/.cacerts.jks
chmod 400 /home/manmon-data/manmon-uploader/.auth/.mycert.p12
chmod 400 /home/manmon-data/manmon-uploader/.auth/.cacerts.jks
cp -p /root/manmon/ssl/server.xml /home/manmon-data/manmon-uploader/conf/server.xml
chown 10006 /home/manmon-data/manmon-uploader/conf/server.xml
chmod 400 /home/manmon-data/manmon-uploader/conf/server.xml

