#!/usr/bin/env python
# -*- coding:utf-8 -*-
 
import urllib
import urllib2
import base64
import sys
from urllib2 import *

if __name__ == "__main__":
	param = sys.argv

	#print param
	input_line2 = param[1]


	response={}
	url="http://eval.api.polestars.jp:8080/webapi/face.do"
	 
	apiKey='23130685f635c1e379ed6a348d8ae20c'
	#print '画像名を入力'
	#input_line2 = raw_input()

	imgPath= input_line2
	 
	headers={
			"pragma":"no-cache",
	}
	 
	#image input and encode
	file=open(imgPath, 'rt').read()
	enc_file=base64.b64encode(file)
	 
	try :
	 params = urllib.urlencode({'apiKey':apiKey, 'mode':'verify', 'inputBase64':enc_file})
	 req = urllib2.Request(url, params ,headers )
	 res = urllib2.urlopen(req)
	 #print res.read()
	 response["body"] = res.read()
	 response["headers"] =  res.info().dict
	except URLError, e:
	 print e
	 exit()
	 
	print response["body"]
