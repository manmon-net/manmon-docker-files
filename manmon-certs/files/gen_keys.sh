#!/bin/bash
if [ `find /home/manmon_certs/.certs/ -type f | wc -l` -gt 0 ]
then
  echo "There is already certificates in destination directory"
  exit 0
fi
if [ ! -f /home/manmon_certs/conf/constants ]
then
  echo "No constants file"
  exit 1
fi
source /home/manmon_certs/conf/constants
if [ -z "$UPLOADSERVERNAME" ]
then
  echo "No UPLOADSERVERNAME variable"
  exit 1
fi
UPLOADSERVERNAME=`echo $UPLOADSERVERNAME | sed 's/^https:\/\///' |sed -e "s/:[0-9]*$//"`
if [ -z "$CAPASSWORD" ]
then
  echo "No CAPASSWORD variable"
  exit 1
fi
if [ -z "$KEYSTOREPASS" ]
then
  echo "No KEYSTOREPASS variable"
  exit 1
fi
if [ -z "$TRUSTSTOREPASS" ]
then
  echo "No TRUSTSTOREPASS variable"
  exit 1
fi
if [ "$UPLOADSERVERNAME" == "manmon-upload2" ]
then 
  echo "Change UPLOADSERVERNAME to non default"
  exit 1
fi
if [ "$CAPASSWORD" == "abcGnjabak124NBjnak15234" ]
then 
  echo "Change CAPASSWORD to non default"
  exit 1
fi
if [ "$KEYSTOREPASS" == "njbkqonhjkavbnjawba3156vanABnjknAbnjkoklga" ]
then 
  echo "Change KEYSTOREPASS to non default"
  exit 1
fi
if [ "$TRUSTSTOREPASS" == "nmkvaQsKmnasvmklvan25489Anbma" ]
then 
  echo "Change TRUSTSTOREPASS to non default"
  exit 1
fi

mkdir -p /home/manmon_certs/tmp
cd /home/manmon_certs/tmp
openssl genrsa -des3 -out ca.key -passout pass:$CAPASSWORD 4096 > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then
  echo "Error creating CA key"
  exit 1
fi
openssl req -new -x509 -days 7200 -key ca.key -subj "/C=FI/ST=Uusimaa/L=Helsinki/O=Manmon/OU=IT/CN=Manmon Root CA" -out ca.crt -passin pass:$CAPASSWORD  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error creating CA cert"
  exit 1
fi
openssl req -newkey rsa:2048 -nodes -keyout server.key -subj "/C=FI/ST=Uusimaa/L=Helsinki/O=Manmon/OU=IT/CN=${UPLOADSERVERNAME}" -out server.csr  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error creating server csr"
  exit 1
fi
openssl x509 -req -extfile <(printf "subjectAltName=DNS:${UPLOADSERVERNAME}") -days 7300 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -passin pass:$CAPASSWORD  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error signing server crt"
  exit 1
fi

openssl pkcs12 -export -in server.crt -inkey server.key -out mycert.p12 -passout pass:$TRUSTSTOREPASS -name tomcat -CAfile ca.crt -caname root -chain  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error creating truststore"
  exit 1
fi
keytool -import -keystore cacerts.jks -storepass $KEYSTOREPASS -alias my_ca -file ca.crt -noprompt  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error creating keystore"
  exit 1
fi

openssl genrsa -out client1.key 2048  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error creating client1 key"
  exit 1
fi
openssl req -new -subj "/C=FI/ST=Uusimaa/L=Helsinki/O=Manmon/OU=IT/CN=client1" -key client1.key -out client1.csr  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error creating client1 csr"
  exit 1
fi
openssl x509 -req -in client1.csr -CA ca.crt -CAkey ca.key  -CAcreateserial -out client1.crt -days 3600 -sha256 -passin pass:$CAPASSWORD  > /dev/null 2>/dev/null
if [ "$?" -ne 0 ]
then 
  echo "Error signing client1 crt"
  exit 1
fi

rm -f uploader-server.xml
cp -p uploader-server.xml.original uploader-server.xml
perl -p -i -e "s/njbkqonhjkavbnjawba3156vanABnjknAbnjkoklga/$TRUSTSTOREPASS/" uploader-server.xml
perl -p -i -e "s/nmkvaQsKmnasvmklvan25489Anbma/$KEYSTOREPASS/" uploader-server.xml
cp ca.* /home/manmon_certs/.certs
cp cacerts.jks /home/manmon_certs/.certs
cp client1.* /home/manmon_certs/.certs
cp mycert.p12 /home/manmon_certs/.certs
cp server.* /home/manmon_certs/.certs
cp uploader-server.xml /home/manmon_certs/.certs
cd ..
rm -rf /home/manmon_certs/tmp

echo "Certificates and keys succesfully created"
