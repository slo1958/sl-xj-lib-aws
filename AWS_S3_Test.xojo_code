#tag Class
Protected Class AWS_S3_Test
Inherits AWS_S3
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  
		  dim dct as new Dictionary
		  
		  dct.value("aws_access_key_id") = "AKIAIOSFODNN7EXAMPLE"
		  dct.value("aws_secret_access_key") = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
		  
		  Super.Constructor(dct)
		  
		  self.RequestDateTime = new Date ' 20130524T000000Z (Fri, 24 May 2013 00:00:00 GMT)
		  self.RequestDateTime.GMTOffset = 0
		  
		  self.RequestDateTime.Year = 2013
		  self.RequestDateTime.Month = 5
		  self.RequestDateTime.Day = 24
		  self.RequestDateTime.Hour = 0
		  self.RequestDateTime.Minute = 0
		  self.RequestDateTime.Second = 0
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractBucketListFromXML_test_01() As string
		  dim tmp_input_xml as string =" <?xml version=""1.0"" encoding=""UTF-8""?> <ListAllMyBucketsResult xmlns=""http://s3.amazonaws.com/doc/2006-03-01/""><Owner><ID>862ff4f13cc748df3224d0e79f06167c0cb86801def02fc14ce123e1d42cf3d1</ID></Owner><Buckets><Bucket><Name>alphabeta</Name><CreationDate>2022-03-14T12:07:48.000Z</CreationDate></Bucket></Buckets></ListAllMyBucketsResult>"
		  
		  dim res_expected as string = "alphabeta"
		  
		  dim  res_calculated as String = join_names(self.ExtractBucketListFromXML(tmp_input_xml))
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		   
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractObjectInfoFromXML_test_01() As string
		  dim tt as string = "<?xml version=""1.0"" encoding=""UTF-8""?><ListBucketResult xmlns=""http://s3.amazonaws.com/doc/2006-03-01/""><Name>alphabeta</Name><Prefix></Prefix><Marker></Marker><MaxKeys>1000</MaxKeys><IsTruncated>false</IsTruncated><Contents><Key>PI-Silenzio-Retro-ZR-(fr).pdf</Key><LastModified>2022-10-26T18:08:55.000Z</LastModified><ETag>&quot;15d1bc42e59983804acd02df7fde75cb&quot;</ETag><Size>2516278</Size><Owner><ID>A862ff4f13cc748df3224d0e79f06167c0cb86801def02fc14ce123e1d42cf3d1</ID></Owner><StorageClass>STANDARD</StorageClass></Contents><Contents><Key>myfiles/</Key><LastModified>2022-10-26T18:11:00.000Z</LastModified><ETag>&quot;d41d8cd98f00b204e9800998ecf8427e&quot;</ETag><Size>0</Size><Owner><ID>B862ff4f13cc748df3224d0e79f06167c0cb86801def02fc14ce123e1d42cf3d1</ID></Owner><StorageClass>STANDARD</StorageClass></Contents></ListBucketResult>"
		  
		  dim res_expected as string = "myfiles/;PI-Silenzio-Retro-ZR-(fr).pdf"
		  
		  dim  res_calculated as String = join_names( ExtractObjectInfoFromXML(tt))
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAuthorisationStr_test_01() As String
		  dim res_expected as string = "AWS4-HMAC-SHA256 Credential=AKIAIOSFODNN7EXAMPLE/20130524/us-east-1/s3/aws4_request,SignedHeaders=host;range;x-amz-content-sha256;x-amz-date,Signature=f0e8bdb87c964420e857bd35b5d6ed310bd44f0170aba48dd91039c6036bdb41"
		  
		  dim tmp_method as string = "GET"
		  dim tmp_host as string = "examplebucket.s3.amazonaws.com"
		  dim tmp_uri as string = "/test.txt"
		  
		  dim tmp_payload as string = ""
		  
		  dim QueryParams as new Dictionary
		  
		  dim Headers() as AWS_Request_Header
		  Headers.Append(new AWS_Request_Header("range","bytes=0-9", True))
		  
		  dim payload_hash as string = self.GetHashedPayload(tmp_payload)
		  dim formatted_timestamp as string = self.TimeStampISO8601Format(self.RequestDateTime)
		  
		  
		  Headers.Append(new AWS_Request_Header("host" ,tmp_host, True))
		  Headers.Append(new AWS_Request_Header("x-amz-content-sha256", payload_hash, True))
		  Headers.Append(new AWS_Request_Header("x-amz-date",formatted_timestamp, True))
		  
		  
		  dim res_calculated as String = self.GetAuthorisationStr(tmp_method, tmp_host, tmp_uri, QueryParams, Headers, payload_hash, self.RequestDateTime)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalQueryStr_test_01() As string
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  dim d as new Dictionary
		  
		  d.Value("prefix") = "somePrefix"
		  d.value("marker") = "someMarker"
		  d.Value("max-keys")="20"
		  
		  dim res_expected as string = "marker=someMarker&max-keys=20&prefix=somePrefix"
		  dim res_calculated as string = GetCanonicalQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalQueryStr_test_02() As string
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  dim d as new Dictionary
		  
		  d.value("marker") = "someMarker"
		  d.Value("lifecycle") = ""
		  d.Value("max-keys")="20"
		  
		  dim res_expected as string = "lifecycle=&marker=someMarker&max-keys=20"
		  dim res_calculated as string = GetCanonicalQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetQueryStr_test_01() As String
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  dim d as new Dictionary
		  
		  d.Value("prefix") = "somePrefix"
		  d.value("marker") = "someMarker"
		  d.Value("max-keys")="20"
		  
		  dim res_expected as string = "marker=someMarker&max-keys=20&prefix=somePrefix"
		  dim res_calculated as string = GetQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetQueryStr_test_02() As string
		  'prefix=somePrefix&marker=someMarker&max-keys=20
		  
		  dim d as new Dictionary
		  
		  d.value("marker") = "someMarker"
		  d.Value("lifecycle") = ""
		  d.Value("max-keys")="20"
		  
		  dim res_expected as string = "lifecycle&marker=someMarker&max-keys=20"
		  dim res_calculated as string = GetQueryStr(d)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_01() As string
		  ' basic version
		  dim res_expected as string = "f0e8bdb87c964420e857bd35b5d6ed310bd44f0170aba48dd91039c6036bdb41"
		  
		  dim payload_hash as string = self.GetHashedPayload("")
		  
		  dim wURI as string = "/test.txt"
		  
		  dim h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", payload_hash, True)) '"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("range", "bytes=0-9", True))
		  
		  dim c as string =  self.GetCanonicalRequest("GET",wURI, new Dictionary, h,payload_hash)
		  
		  dim res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_02() As string
		  ' test hash payload
		  '
		  dim res_expected as string = "98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd"
		  dim payload_hash as string = self.GetHashedPayload("Welcome to Amazon S3.")
		  dim wURI as string = "/test$file.text"
		  
		  dim h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("date","Fri, 24 May 2013 00:00:00 GMT",True))
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256",payload_hash, True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("x-amz-storage-class","REDUCED_REDUNDANCY", True))
		  
		  dim c as string =  self.GetCanonicalRequest("PUT",wURI, new Dictionary, h,payload_hash)
		  
		  dim res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_03() As string
		  ' add query parameter without value
		  dim res_expected as string = "fea454ca298b7da1c68078a5d1bdbfbbe0d65c699e0f91ac7a200a0136783543"
		  
		  dim payload_hash as string = self.GetHashedPayload("")
		  
		  dim wURI as string = "/"
		  
		  dim h() as AWS_Request_Header
		  
		  
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  
		  
		  dim queryparams as new Dictionary
		  queryparams.value("lifecycle")=""
		  
		  dim c as string =  self.GetCanonicalRequest("GET",wURI, queryparams, h,payload_hash)
		  
		  dim res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_04() As string
		  ' add payload
		  dim res_expected as string = "98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd"
		  dim payload_hash as string = self.GetHashedPayload("Welcome to Amazon S3.")
		  dim wURI as string = "/test$file.text"
		  
		  dim h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("date","Fri, 24 May 2013 00:00:00 GMT",True))
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", "44ce7dd67c959e0d3524ffac1771dfbba87d2b6b4b4e99e42034a8b803f8b072", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("x-amz-storage-class","REDUCED_REDUNDANCY", True))
		  
		  dim c as string =  self.GetCanonicalRequest("PUT",wURI, new Dictionary, h,payload_hash)
		  
		  dim res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature_test_05() As string
		  ' Test TimeStampRFC7231 
		  
		  dim res_expected as string = "98ad721746da40c64f1a55b78f14c238d841ea1380cd77a1b5971af0ece108bd"
		  dim payload_hash as string = self.GetHashedPayload("Welcome to Amazon S3.")
		  dim wURI as string = "/test$file.text"
		  
		  dim h() as AWS_Request_Header
		  
		  h.Append(new AWS_Request_Header("date",self.TimeStampRFC7231(self.RequestDateTime),True))
		  h.Append(new AWS_Request_Header("host" ,"examplebucket.s3.amazonaws.com", True))
		  h.Append(new AWS_Request_Header("x-amz-content-sha256", "44ce7dd67c959e0d3524ffac1771dfbba87d2b6b4b4e99e42034a8b803f8b072", True))
		  h.Append(new AWS_Request_Header("x-amz-date","20130524T000000Z", True))
		  h.Append(new AWS_Request_Header("x-amz-storage-class","REDUCED_REDUNDANCY", True))
		  
		  dim c as string =  self.GetCanonicalRequest("PUT",wURI, new Dictionary, h,payload_hash)
		  
		  dim res_calculated as String = GetSignature(self.RequestDateTime,c)
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function join_names(items() as AWS_S3_item) As string
		  
		  dim tmp() as string
		  
		  for each item as AWS_S3_item in items
		    tmp.Append(item.Name)
		    
		  next
		  
		  tmp.sort
		  
		  return join(tmp,";")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SHA256_test_01() As string
		  dim res_expected as string = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
		  
		  
		  dim v as MemoryBlock = Crypto.SHA256("")
		  
		  dim res_calculated as string = AWS_S3.MemoryBlockToHex(v).Lowercase()
		  
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SHA256_test_02() As string
		  dim res_expected as string = "7344ae5b7ee6c3e7e6b0fe0640412a37625d1fbfff95c48bbb2dc43964946972"
		  
		  dim tmp_elements() as string
		  
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
		  
		  dim v as MemoryBlock = Crypto.SHA256(join(tmp_elements, chr(10)))
		  
		  dim res_calculated as string = AWS_S3.MemoryBlockToHex(v).Lowercase()
		  
		  
		  return CurrentMethodName + chr(9) + res_calculated + chr(9) + res_expected + chr(9) + str(res_calculated = res_expected)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test_all()
		  dim test_results() as string
		  
		  
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
		  
		  
		  dim nb_tests as integer
		  dim nb_ok as integer
		  
		  for each one_result as string in test_results
		    nb_tests = nb_tests + 1
		    
		    dim item() as string  = one_result.split(chr(9))
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
			Name="AWSAccessKeyId"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSRegion"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSSecretAccessKey"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSService"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
