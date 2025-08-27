#tag Class
Protected Class AWS_S3_InternalTests
Inherits AWS_S3_Host
	#tag Method, Flags = &h0
		Sub Constructor()
		  //
		  // Class uses to test the elements used in the calculation of the signing key
		  //
		  // Not required for normal usage
		  // 
		  var dct as new Dictionary
		  
		  dct.value(aws_keyword_access_key_id) = "AKIAIOSFODNN7EXAMPLE"
		  dct.value(aws_keyword_secret_access_key) = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
		  
		  Super.Constructor(dct, True)
		  
		  self.RequestDateTime = new Date ' 20130524T000000Z (Fri, 24 May 2013 00:00:00 GMT)
		  self.RequestDateTime.GMTOffset = 0
		  
		  self.RequestDateTime.Year = 2013
		  self.RequestDateTime.Month = 5
		  self.RequestDateTime.Day = 24
		  self.RequestDateTime.Hour = 0
		  self.RequestDateTime.Minute = 0
		  self.RequestDateTime.Second = 0
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeError_test_01() As string
		  var res_calculated as String
		  
		  var input_str as string = "<?xml version=""1.0"" encoding=""UTF-8""?><Error><Code>NoSuchBucket</Code><Message>The specified bucket does not exist</Message><BucketName>sl58-aws-bucket-001kk</BucketName><RequestId>2DPRQCN9JMZG10G7</RequestId><HostId>42ZoaPcOc+06Vc7WP4bAzj7JPtj9Pnb9lJGZbM2b/nIPeI8IWTLCp1vjRnBbqJb66E/WjqKcHnRpZi7SwT9K+g==</HostId></Error>"
		  var res_expected as string = "NoSuchBucket::The specified bucket does not exist"
		  
		  
		  var tmp as new AWS_Error_info(new XmlDocument(input_str))
		  res_calculated = tmp.Code+"::"+tmp.message
		  
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeTimeStamp_test_01() As string
		  var res_calculated as String
		  var res_expected as string = "2022-11-07 11:03:43"
		  
		  var input_str as string = "Mon, 07 Nov 2022 11:03:43 GMT"
		  
		  
		  var tmp_date as date = AWS_Common_Request.DecodeTimeStamp(input_str)
		  
		  if tmp_date = nil then
		    res_calculated = "NIL"
		  else 
		    res_calculated= AWS_Common_Request.DecodeTimeStamp(input_str).SQLDateTime
		  end if
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeTimeStamp_test_02() As string
		  var res_calculated as String
		  var res_expected as string = "NIL"
		  
		  var input_str as string = "Mon, 07 YAPI 2022 11:03:43 GMT"
		  
		  var tmp_date as date = AWS_Common_Request.DecodeTimeStamp(input_str)
		  
		  if tmp_date = nil then
		    res_calculated = "NIL"
		  else 
		    res_calculated= AWS_Common_Request.DecodeTimeStamp(input_str).SQLDateTime
		  end if
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeTimeStamp_test_03() As string
		  var res_calculated as String
		  var res_expected as string = "NIL"
		  
		  var input_str as string = "Mon, 07 Nov 2022 11:03:43 UTC+2"
		  
		  var tmp_date as date = AWS_Common_Request.DecodeTimeStamp(input_str)
		  
		  if tmp_date = nil then
		    res_calculated = "NIL"
		  else 
		    res_calculated= AWS_Common_Request.DecodeTimeStamp(input_str).SQLDateTime
		  end if
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractBucketListFromXML_test_01() As string
		  var tmp_input_xml as string =" <?xml version=""1.0"" encoding=""UTF-8""?> <ListAllMyBucketsResult xmlns=""http://s3.amazonaws.com/doc/2006-03-01/""><Owner><ID>862ff4f13cc748df3224d0e79f06167c0cb86801def02fc14ce123e1d42cf3d1</ID></Owner><Buckets><Bucket><Name>alphabeta</Name><CreationDate>2022-03-14T12:07:48.000Z</CreationDate></Bucket></Buckets></ListAllMyBucketsResult>"
		  
		  var res_expected as string = "alphabeta"
		  
		  var  res_calculated as String = join_names(AWS_S3_ListBuckets.ExtractBucketListFromXML(new XMLDocument(tmp_input_xml)))
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractObjectInfoFromXML_test_01() As string
		  var tmp_input_xml as string = "<?xml version=""1.0"" encoding=""UTF-8""?><ListBucketResult xmlns=""http://s3.amazonaws.com/doc/2006-03-01/""><Name>alphabeta</Name><Prefix></Prefix><Marker></Marker><MaxKeys>1000</MaxKeys><IsTruncated>false</IsTruncated><Contents><Key>PI-Silenzio-Retro-ZR-(fr).pdf</Key><LastModified>2022-10-26T18:08:55.000Z</LastModified><ETag>&quot;15d1bc42e59983804acd02df7fde75cb&quot;</ETag><Size>2516278</Size><Owner><ID>A862ff4f13cc748df3224d0e79f06167c0cb86801def02fc14ce123e1d42cf3d1</ID></Owner><StorageClass>STANDARD</StorageClass></Contents><Contents><Key>myfiles/</Key><LastModified>2022-10-26T18:11:00.000Z</LastModified><ETag>&quot;d41d8cd98f00b204e9800998ecf8427e&quot;</ETag><Size>0</Size><Owner><ID>B862ff4f13cc748df3224d0e79f06167c0cb86801def02fc14ce123e1d42cf3d1</ID></Owner><StorageClass>STANDARD</StorageClass></Contents></ListBucketResult>"
		  
		  var res_expected as string = "myfiles/;PI-Silenzio-Retro-ZR-(fr).pdf"
		  
		  var  res_calculated as String = join_names( AWS_S3_ListObjectsInBucket.ExtractObjectInfoFromXML(new XMLDocument(tmp_input_xml)))
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAuthorisationStr_test_01() As String
		  var res_expected as string = "AWS4-HMAC-SHA256 Credential=AKIAIOSFODNN7EXAMPLE/20130524/us-east-1/s3/aws4_request,SignedHeaders=host;range;x-amz-content-sha256;x-amz-date,Signature=f0e8bdb87c964420e857bd35b5d6ed310bd44f0170aba48dd91039c6036bdb41"
		  
		  var tmp_method as string = "GET"
		  var tmp_host as string = "examplebucket.s3.amazonaws.com"
		  var tmp_uri as string = "/test.txt"
		  
		  var tmp_payload as string = ""
		  
		  var QueryParams as new Dictionary
		  
		  var Headers() as AWS_Request_Header
		  Headers.Append(new AWS_Request_Header("range","bytes=0-9", True))
		  
		  var payload_hash as string = self.GetHashedPayload(tmp_payload)
		  var formatted_timestamp as string = self.TimeStampISO8601Format(self.RequestDateTime)
		  
		  
		  Headers.Append(new AWS_Request_Header("host" ,tmp_host, True))
		  Headers.Append(new AWS_Request_Header("x-amz-content-sha256", payload_hash, True))
		  Headers.Append(new AWS_Request_Header("x-amz-date",formatted_timestamp, True))
		  
		  
		  var res_calculated as String = self.GetAuthorisationStr(tmp_method, tmp_host, tmp_uri, QueryParams, Headers, payload_hash, self.RequestDateTime)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalQueryStr_test_01() As string
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  var d as new Dictionary
		  
		  d.Value("prefix") = "somePrefix"
		  d.value("marker") = "someMarker"
		  d.Value("max-keys")="20"
		  
		  var res_expected as string = "marker=someMarker&max-keys=20&prefix=somePrefix"
		  var res_calculated as string = GetCanonicalQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalQueryStr_test_02() As string
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  var d as new Dictionary
		  
		  d.value("marker") = "someMarker"
		  d.Value("lifecycle") = ""
		  d.Value("max-keys")="20"
		  
		  var res_expected as string = "lifecycle=&marker=someMarker&max-keys=20"
		  var res_calculated as string = GetCanonicalQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetQueryStr_test_01() As String
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  var d as new Dictionary
		  
		  d.Value("prefix") = "somePrefix"
		  d.value("marker") = "someMarker"
		  d.Value("max-keys")="20"
		  
		  var res_expected as string = "marker=someMarker&max-keys=20&prefix=somePrefix"
		  var res_calculated as string = GetQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetQueryStr_test_02() As string
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  var d as new Dictionary
		  
		  d.value("marker") = "someMarker"
		  d.Value("lifecycle") = ""
		  d.Value("max-keys")="20"
		  
		  var res_expected as string = "lifecycle&marker=someMarker&max-keys=20"
		  var res_calculated as string = GetQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_01() As string
		  ' basic version
		  var res_expected as string = "f0e8bdb87c964420e857bd35b5d6ed310bd44f0170aba48dd91039c6036bdb41"
		  
		  var payload_hash as string = self.GetHashedPayload("")
		  
		  var wURI as string = "/test.txt"
		  
		  var h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", payload_hash, True)) '"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("range", "bytes=0-9", True))
		  
		  var c as string =  self.GetCanonicalRequest("GET",wURI, new Dictionary, h,payload_hash)
		  
		  var res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_02() As string
		  ' test hash payload
		  '
		  var res_expected as string = "98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd"
		  var payload_hash as string = self.GetHashedPayload("Welcome to Amazon S3.")
		  var wURI as string = "/test$file.text"
		  
		  var h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("date","Fri, 24 May 2013 00:00:00 GMT",True))
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256",payload_hash, True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("x-amz-storage-class","REDUCED_REDUNDANCY", True))
		  
		  var c as string =  self.GetCanonicalRequest("PUT",wURI, new Dictionary, h,payload_hash)
		  
		  var res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_03() As string
		  ' add query parameter without value
		  var res_expected as string = "fea454ca298b7da1c68078a5d1bdbfbbe0d65c699e0f91ac7a200a0136783543"
		  
		  var payload_hash as string = self.GetHashedPayload("")
		  
		  var wURI as string = "/"
		  
		  var h() as AWS_Request_Header
		  
		  
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  
		  
		  var queryparams as new Dictionary
		  queryparams.value("lifecycle")=""
		  
		  var c as string =  self.GetCanonicalRequest("GET",wURI, queryparams, h,payload_hash)
		  
		  var res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_04() As string
		  ' add payload
		  var res_expected as string = "98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd"
		  var payload_hash as string = self.GetHashedPayload("Welcome to Amazon S3.")
		  var wURI as string = "/test$file.text"
		  
		  var h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("date","Fri, 24 May 2013 00:00:00 GMT",True))
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", "44ce7dd67c959e0d3524ffac1771dfbba87d2b6b4b4e99e42034a8b803f8b072", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("x-amz-storage-class","REDUCED_REDUNDANCY", True))
		  
		  var c as string =  self.GetCanonicalRequest("PUT",wURI, new Dictionary, h,payload_hash)
		  
		  var res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_05() As string
		  ' Test TimeStampRFC7231 
		  
		  var res_expected as string = "98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd"
		  var payload_hash as string = self.GetHashedPayload("Welcome to Amazon S3.")
		  var wURI as string = "/test$file.text"
		  
		  var h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("date",self.TimeStampRFC7231(self.RequestDateTime),True))
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", "44ce7dd67c959e0d3524ffac1771dfbba87d2b6b4b4e99e42034a8b803f8b072", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("x-amz-storage-class","REDUCED_REDUNDANCY", True))
		  
		  var c as string =  self.GetCanonicalRequest("PUT",wURI, new Dictionary, h,payload_hash)
		  
		  var res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function join_names(items() as AWS_S3_item) As string
		  
		  var tmp() as string
		  
		  for each item as AWS_S3_item in items
		    tmp.Append(item.Name)
		    
		  next
		  
		  tmp.sort
		  
		  return join(tmp,";")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SHA256_test_01() As string
		  var res_expected as string = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
		  
		  
		  var v as MemoryBlock = Crypto.SHA256("")
		  
		  var res_calculated as string = AWS_S3_Host.MemoryBlockToHex(v).Lowercase()
		  
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SHA256_test_02() As string
		  var res_expected as string = "7344ae5b7ee6c3e7e6b0fe0640412a37625d1fbfff95c48bbb2dc43964946972"
		  
		  var tmp_elements() as string
		  
		  tmp_elements.append("GET")
		  tmp_elements.append("/test.txt")
		  tmp_elements.append("")
		  tmp_elements.append("host:examplebucket.s3.amazonaws.com")
		  tmp_elements.append("range:bytes=0-9")
		  tmp_elements.append("x-amz-content-sha256:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
		  tmp_elements.append("x-amz-date:20130524T000000Z")
		  tmp_elements.append("")
		  tmp_elements.append("host;range;x-amz-content-sha256;x-amz-date")
		  tmp_elements.append("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
		  
		  var v as MemoryBlock = Crypto.SHA256(join(tmp_elements, chr(10)))
		  
		  var res_calculated as string = AWS_S3_Host.MemoryBlockToHex(v).Lowercase()
		  
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_all()
		  var test_results() as string
		  
		  
		  test_results.Append(self.GetCanonicalQueryStr_test_01())
		  test_results.Append(self.GetCanonicalQueryStr_test_02())
		  
		  test_results.Append(self.GetQueryStr_test_01())
		  test_results.Append(self.GetQueryStr_test_02())
		  
		  test_results.Append(self.SHA256_test_01())
		  test_results.Append(self.SHA256_test_02())
		  
		  test_results.Append(self.GetSignature_test_01)
		  test_results.Append(self.GetSignature_test_02)
		  test_results.Append(self.GetSignature_test_03)
		  test_results.Append(self.GetSignature_test_04)
		  test_results.Append(self.GetSignature_test_05)
		  
		  test_results.Append(self.GetAuthorisationStr_test_01)
		  
		  test_results.Append(self.ExtractBucketListFromXML_test_01)
		  
		  test_results.Append(self.ExtractObjectInfoFromXML_test_01)
		  
		  test_results.Append(self.DecodeTimeStamp_test_01)
		  test_results.Append(self.DecodeTimeStamp_test_02)
		  test_results.Append(self.DecodeTimeStamp_test_03)
		  
		  test_results.Append(self.DecodeError_test_01)
		  
		  var nb_tests as integer
		  var nb_ok as integer
		  
		  for each one_result as string in test_results
		    nb_tests = nb_tests + 1
		    
		    //
		    //each test method returns the name of the method, the actual results, the expected results and the status / tab separated string
		    //
		    var item() as string  = one_result.split(chr(9))
		    if item(3) = "True" then
		      nb_ok = nb_ok + 1
		      
		    else
		      System.DebugLog("Test failed: "+item(0))
		      System.DebugLog("- Expected:"+item(2))
		      System.DebugLog("- Calculated:"+item(1))
		      
		    end if
		    
		  next
		  System.DebugLog("Test results: " + str(nb_tests) + " executed, "+str(nb_ok)+ " passed (" + format(nb_ok/nb_tests*100,"##0.0")+"%)")
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="AWSProvider"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LogFileName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TraceMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSAccessKeyId"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSRegion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSSecretAccessKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSService"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
