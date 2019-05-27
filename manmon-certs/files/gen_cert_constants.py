#!/usr/bin/python3

import random
import string
import json
import sys

def getRandomAlphaNumeric(length):
    chars = string.ascii_letters + string.digits
    iv = ''.join((random.choice(chars)) for x in range(length))
    return iv

f = open("/home/manmon-certs/conf/constants","w")
f.write("UPLOADSERVERNAME="+sys.argv[1]+"\n")
f.write("CAPASSWORD="+getRandomAlphaNumeric(64)+"\n")
f.write("KEYSTOREPASS="+getRandomAlphaNumeric(64)+"\n")
f.write("TRUSTSTOREPASS="+getRandomAlphaNumeric(64)+"\n")
f.flush()
f.close()
