import random
import string
import json
import sys

def getRandom(length):
    chars = string.ascii_letters + string.digits + string.punctuation
    iv = ''.join((random.choice(chars)) for x in range(length))
    return iv

class Constants():
    def __init__(self):
        self.upload_host=sys.argv[1]
        self.x=getRandom(32)
        self.y=getRandom(16)
        self.xout=self.x[:16]
        self.xin=getRandom(16)

class TomcatConstants():
    def __init__(self,tx,txin):
        self.tx=tx
        self.txin=txin
        self.y=getRandom(40)

def jsonDefEncoder(obj):
    if hasattr(obj,'jsonEnc'):
        return obj.jsonEnc()
    else:
        return obj.__dict__


constants=Constants()
f = open("/home/manmon-conf/.constants","w")
f.write(json.dumps(constants,default=jsonDefEncoder))
f.flush()
f.close
tomcatConstants=TomcatConstants(constants.xout,constants.xin)
f = open("/home/manmon-conf/.tomcat_constants","w")
f.write(json.dumps(tomcatConstants,default=jsonDefEncoder))
f.flush()
f.close

