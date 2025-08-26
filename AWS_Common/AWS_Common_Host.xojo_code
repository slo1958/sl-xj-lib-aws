#tag Class
Protected Class AWS_Common_Host
	#tag Method, Flags = &h0
		Shared Function ComputeBlockSizedKey(key as MemoryBlock, blockSize as integer) As MemoryBlock
		  
		  
		  var tmp_key as MemoryBlock = key
		  var tmp_out as MemoryBlock
		  
		  
		  if tmp_key.size > BlockSize then 
		    tmp_out = Crypto.SHA256(tmp_key)
		    
		  Else  
		    tmp_out = new MemoryBlock(BlockSize)
		    
		    for i as Integer = 0 to BlockSize-1
		      if i < tmp_key.size then
		        tmp_out.Byte(i) = tmp_key.byte(i)
		      else
		        tmp_out.Byte(i) = 0
		      end if
		    next
		    
		  end if
		  
		  return tmp_out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(credentials as Dictionary)
		  
		  self.AWSAccessKeyId = credentials.value("aws_access_key_id")
		  self.AWSSecretAccessKey = credentials.value("aws_secret_access_key")
		  self.AWSRegion = credentials.lookup("aws_region", "us-east-1")
		  self.AWSService = "??"
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theAWSAccessKeyId as string, theAWSSecretKey as string, theRegion as string="us-east-1")
		  self.AWSAccessKeyId = theAWSAccessKeyId.trim()
		  self.AWSSecretAccessKey = theAWSSecretKey.trim()
		  self.AWSRegion = theRegion.trim() 
		  self.AWSService = "??"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAuthorisationStr(HTTPMethod as string, Host as string, URI as String, QueryParams as dictionary, Headers() as AWS_Request_Header, payload_hash as string, RequestTime as date) As String
		  '
		  ' Header contains the AWS specific headers
		  ' 
		  var tmp_canonical_request as string = self.GetCanonicalRequest(HTTPMethod, URI, QueryParams, Headers, payload_hash)
		  
		  var tmp_signature as string = self.GetSignature(RequestTime, tmp_canonical_request)
		  
		  var tmp_signedheaders as string = self.GetListSignedHeaders(Headers)
		  
		  app.write_s3_sep(self.LogFileName,"AUTHORISATION")
		  app.write_s3_log(self.LogFileName, "Canonical request",chr(10) +  tmp_canonical_request)
		  app.write_s3_log(self.LogFileName,"Signature", tmp_signature)
		  app.write_s3_log(self.LogFileName,"Signed headers", tmp_signedheaders)
		  
		  var tmp_auth_str as string
		  
		  var tmp_credential_elements() as string
		  tmp_credential_elements.append(self.AWSAccessKeyId)
		  tmp_credential_elements.append(self.TimeStampYYYYMMDD(RequestTime))
		  tmp_credential_elements.append(self.AWSRegion)
		  tmp_credential_elements.append(self.AWSService)
		  tmp_credential_elements.append("aws4_request")
		  
		  var tmp_credential as string = join(tmp_credential_elements,"/")
		  
		  tmp_auth_str = self.HashingType
		  tmp_auth_str = tmp_auth_str + " "
		  
		  tmp_auth_str = tmp_auth_str + "Credential=" + tmp_credential
		  tmp_auth_str = tmp_auth_str + ","
		  
		  tmp_auth_str = tmp_auth_str + "SignedHeaders="+tmp_signedheaders
		  tmp_auth_str = tmp_auth_str + ","
		  tmp_auth_str = tmp_auth_str + "Signature="+tmp_signature
		  
		  app.write_s3_log(self.LogFileName,"Calc authorisation", tmp_auth_str)
		  
		  return tmp_auth_str
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalHeaders(Headers() as AWS_Request_Header) As String
		  var tmp_list() as string
		  var tmp_dct as new Dictionary
		  var tmp_elements() as string
		  
		  for each header as AWS_Request_Header in Headers
		    if header.AddToSignature then // 2025-08-26 20:23
		      var tmp_name as string =  header.Name.Lowercase()
		      tmp_list.Append(tmp_name)
		      tmp_dct.Value(tmp_name) = header
		      
		    end if
		    
		  next
		  
		  tmp_list.sort()
		  
		  for each name as string in tmp_list
		    var header as AWS_Request_Header = tmp_dct.Value(name)
		    tmp_elements.Append(name+":"+header.Value.trim())
		    
		  next
		  
		  return join(tmp_elements, chr(10))+chr(10)
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalQueryStr(theQueryParams as Dictionary) As string
		  
		  var dct as Dictionary = theQueryParams
		  var tmp_list() as string
		  var tmp_elements() as string
		  
		  for each k as string in dct.Keys
		    tmp_list.Append(k)
		    
		  next
		  
		  tmp_list.sort
		  
		  for each k as String in tmp_list
		    var v as string = dct.Value(k)
		    if len(v)=0 then
		      tmp_elements.Append(UriEncode(k) + "=")
		    else
		      tmp_elements.Append(UriEncode(k) + "=" + UriEncode(v))
		      
		    end if
		    
		  next
		  
		  return join(tmp_elements, "&")
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalRequest(HTTPMethod as string, URI as String, QueryParams as dictionary, Headers() as AWS_Request_Header, payloadHash as string) As String
		  'HTTPMethod>\n'
		  '<CanonicalURI>\n
		  '<CanonicalQueryString>\n
		  '<CanonicalHeaders>\n
		  '<SignedHeaders>\n
		  '<HashedPayload>
		  
		  
		  var CanonicalURI as string = UriEncode(URI, True)
		  var CanonicalQueryStr as string = self.GetCanonicalQueryStr(QueryParams)
		  var CanonicalHeaders as string = self.GetCanonicalHeaders(headers)
		  var SignedHeaders as String = self.GetListSignedHeaders(headers)
		  
		  var tmp_elements() as string
		  
		  tmp_elements.Append(HTTPMethod)
		  tmp_elements.Append(CanonicalURI)
		  tmp_elements.Append(CanonicalQueryStr)
		  tmp_elements.Append(CanonicalHeaders)
		  tmp_elements.Append(SignedHeaders)
		  tmp_elements.Append(payloadHash)
		  
		  ' for debugging purposes
		  self.CanonicalRequestElements = tmp_elements
		  
		  return join(tmp_elements, chr(10))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetChildNodeFromXMLNode(theNode as XMLNode, theChildName as string) As XmlNode
		  var tmp_src_node as XmlNode = theNode
		  
		  var ret_value as XmlNode
		  
		  var tmp_wrk_node as XmlNode = tmp_src_node.FirstChild
		  
		  while tmp_wrk_node <> nil
		    if tmp_wrk_node.Name = theChildName then
		      ret_value = tmp_wrk_node
		    end if
		    
		    tmp_wrk_node = tmp_wrk_node.NextSibling
		  wend
		  
		  return ret_value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHashedPayload(thePayload as String) As string
		  
		  var payload as string = thePayload
		  
		  var v as MemoryBlock = Crypto.SHA256(payload)
		  
		  return AWS_S3_host.MemoryBlockToHex(v).Lowercase()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getHost(withRegion as Boolean = True) As string
		  if withRegion then
		    return AWSService + "." + AWSRegion + ".amazonaws.com"
		    
		  else
		    return AWSService + ".amazonaws.com"
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetListSignedHeaders(Headers() as AWS_Request_Header) As String
		  var tmp_list() as string 
		  
		  for each header as AWS_Request_Header in Headers
		    if header.AddToSignature then
		      var tmp_name as string =  header.Name.Lowercase()
		      tmp_list.Append(tmp_name)
		    end if
		    
		  next
		  
		  tmp_list.sort()
		  
		  return join(tmp_list,";")
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetQueryStr(theQueryParams as Dictionary) As string
		  
		  var dct as Dictionary = theQueryParams
		  var tmp_list() as string
		  var tmp_elements() as string
		  
		  for each k as string in dct.Keys
		    tmp_list.Append(k)
		    
		  next
		  
		  tmp_list.sort
		  
		  for each k as String in tmp_list
		    var v as string = dct.Value(k)
		    if len(v)=0 then
		      tmp_elements.Append(UriEncode(k))
		    else
		      tmp_elements.Append(UriEncode(k) + "=" + UriEncode(v))
		      
		    end if
		    
		  next
		  
		  return join(tmp_elements, "&")
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSignature(theDate as date, theCanonicalRequest as string) As string
		  
		  'AWS4-HMAC-SHA256
		  '20221027T080118Z
		  '20221027/us-east-1/s3/aws4_request
		  'cf45edb2ce2dad557303828c17b1e9a1f112bbcfaca8c32e24751d2987dd7cf4
		  
		  var tmp_hashType as string = self.HashingType
		  
		  var tmp_date as date = theDate
		  var tmp_CanonicalRequest as String = theCanonicalRequest
		  
		  var fmt_date as string = self.TimeStampISO8601Format(tmp_date)
		  var fmt_date_short as String = self.TimeStampYYYYMMDD(tmp_date)
		  var fmt_scope as string = fmt_date_short +"/" + self.AWSRegion + "/"+ self.AWSService + "/aws4_request"
		  var hashed_request as String = MemoryBlockToHex(Crypto.SHA256(tmp_CanonicalRequest)).Lowercase()
		  
		  app.write_s3_sep(LogFileName, "Create string to sign")
		  app.write_s3_log(LogFileName, "Hash type", tmp_hashType)
		  app.write_s3_log(LogFileName, "ISO Date/time", fmt_date)
		  app.write_s3_log(LogFileName, "Scope", fmt_scope)
		  app.write_s3_log(LogFileName, "Canonical request hash", hashed_request)
		  app.write_s3_sep(LogFileName)
		  
		  
		  var tmp_elements() as String
		  
		  tmp_elements.Append(tmp_hashType)
		  tmp_elements.Append(fmt_date)
		  tmp_elements.Append(fmt_scope)
		  tmp_elements.Append(hashed_request)
		  
		  ' Save in property for debugging purposes
		  self.StringToSignElements = tmp_elements
		  
		  var StringToSign as string = join(tmp_elements, chr(10))
		  
		  'signing key = HMAC-SHA256(HMAC-SHA256(HMAC-SHA256(HMAC-SHA256("AWS4" + "<YourSecretAccessKey>","20130524"),"us-east-1"),"s3"),"aws4_request")
		  
		  var tmp0_secret as String = "AWS4"+self.AWSSecretAccessKey
		  var tmp1_date as MemoryBlock = HMAC_SHA256(tmp0_secret, fmt_date_short)
		  var tmp2_region as MemoryBlock = HMAC_SHA256(tmp1_date, self.AWSRegion)
		  var tmp3_service as MemoryBlock = HMAC_SHA256(tmp2_region, self.AWSService)
		  var tmp4_request as MemoryBlock = HMAC_SHA256(tmp3_service, "aws4_request")
		  var tmp5_signature as string = MemoryBlockToHex(HMAC_SHA256(tmp4_request, StringToSign)).Lowercase()
		  
		  app.write_s3_sep(LogFileName, "Signing")
		  app.write_s3_log(LogFileName, "Signing key",  MemoryBlockToHex(tmp4_request))
		  app.write_s3_log(LogFileName, "Signature", tmp5_signature)
		  app.write_s3_sep(LogFileName)
		  
		  return tmp5_signature
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetValueFromXMLNode(theNode as XMLNode, theItem as string) As String
		  var tmp_src_node as XmlNode = theNode
		  
		  var ret_value as String
		  var tmp_wrk_node as XmlNode = tmp_src_node.FirstChild
		  
		  while tmp_wrk_node <> nil
		    if tmp_wrk_node.Name = theItem then
		      ret_value = tmp_wrk_node.FirstChild.Value
		    end if
		    
		    tmp_wrk_node = tmp_wrk_node.NextSibling
		  wend
		  
		  return ret_value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HashingType() As string
		  return "AWS4-HMAC-SHA256"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HMAC_SHA256(theKey as MemoryBlock, theSource as String) As MemoryBlock
		  '
		  ' see RFC2104
		  '
		  
		  const BlockSize=64
		  const OutputSize = 32 ' was 20 for HMAC_SHA1
		  
		  var i_key_mask as UInt64 = &h3636363636363636
		  var o_key_mask as UInt64 = &h5C5C5C5C5C5C5C5C
		  
		  var tmp_key as MemoryBlock = theKey
		  var tmp_str as String = theSource
		  
		  var len_str as integer = len(tmp_str)
		  
		  var mb_input as new MemoryBlock(len_str+1)
		  var mb_output as MemoryBlock
		  
		  mb_input = tmp_str
		  
		  var base_key as MemoryBlock = computeBlockSizedKey(tmp_key, BlockSize)
		  
		  var i_key_pad as new MemoryBlock(BlockSize + len_str )
		  var o_key_pad as new MemoryBlock(BlockSize + OutputSize)
		  
		  
		  for i as integer = 0 to BlockSize-1 step 8
		    i_key_pad.UInt64Value(i) = BitwiseXor( base_key.UInt64Value(i) , i_key_mask )
		    o_key_pad.UInt64Value(i) = BitwiseXor( base_key.UInt64Value(i) , o_key_mask )
		  next
		  
		  for i as integer = BlockSize to BlockSize + len_str-1
		    i_key_pad.UInt8Value(i) = mb_input.UInt8Value(i-BlockSize)
		    
		  next
		  
		  var mb_temp as MemoryBlock = Crypto.SHA256(i_key_pad)
		  
		  for i as integer = BlockSize to BlockSize + OutputSize -1
		    o_key_pad.UInt8Value(i) = mb_temp.UInt8Value(i-BlockSize)
		    
		  next
		  
		  mb_output = Crypto.SHA256(o_key_pad)
		  
		  return mb_output
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadCredentials(credentials_group as string = "default") As Dictionary
		  //
		  // Credential file example:
		  //
		  // [default]
		  // aws_access_key_id = <access key_id>
		  // aws_secret_access_key = <access key secret>
		  // aws_region = <aws region>
		  //
		  
		  
		  
		  
		  var search_str as string = credentials_group
		  
		  var dct as new Dictionary
		  
		  var txt_buffer as string = credentials.ReplaceAll(chr(13), chr(10))
		  var lines_buffer() as string = txt_buffer.Split(chr(10))
		  var parts() as string
		  
		  var section_found as boolean = false
		  
		  for each line as string in lines_buffer
		    line = line.Trim()
		    
		    
		    if line = "[" + search_str +"]" then
		      section_found = True
		      
		    elseif line.left(1)="[" and line.right(1)="]" then
		      section_found = False
		      
		    elseif section_found then
		      parts = line.split("=")
		      
		      if parts.Ubound = 1 then
		        dct.Value(parts(0).trim) = parts(1).trim
		      else
		        System.DebugLog("Ignoring " + line)
		        
		      end if
		    else
		      
		    end if
		    
		  next
		  
		  System.DebugLog("Access_key:" + dct.Lookup("aws_access_key_id","(missing)"))
		  System.DebugLog("Region:" + dct.Lookup("aws_region","(missing)"))
		  
		  return dct
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MemoryBlockToHex(m as MemoryBlock) As String
		  var tmp as string
		  
		  for i as integer = 0 to m.Size-1
		    var tmp_int as integer = m.UInt8Value(i)
		    tmp = tmp + tmp_int.ToHex(2)
		  next
		  
		  return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Request(HTTPMethod as string, Host as string, URI as String, QueryParams as dictionary, UserHeaders() as AWS_Request_Header, payload as string) As AWS_Reply
		  
		  self.RequestDateTime = new date() // 2024,9,14,21,55,28,0)
		  
		  LogFileName = self.RequestDateTime.SQLDateTime.ReplaceAll(":","-") + ".txt"
		  
		  '
		  ' Add AWS headers
		  '
		  app.write_s3_log(LogFileName, "HTTP Method", HTTPMethod)
		  app.write_s3_log(LogFileName, "Host", Host)
		  app.write_s3_log(LogFileName, "URI", URI)
		  
		  app.write_s3_sep(LogFileName,"Query params")
		  
		  for each k as string in QueryParams.keys
		    app.write_s3_log(LogFileName, k, QueryParams.Value(k))
		    
		  next
		  
		  app.write_s3_sep(LogFileName,"Payload")
		  
		  if payload.Length > 100 then
		    App.write_s3_log(LogFileName, "", left(payload, 99)+"...")
		    
		  else
		    App.write_s3_log(LogFileName, "", payload)
		    
		  end if
		  
		  app.write_s3_log(LogFileName,"","")
		  
		  var payload_hash as string = self.GetHashedPayload(payload)
		  var formatted_timestamp as string = self.TimeStampISO8601Format(self.RequestDateTime)
		  
		  app.write_s3_log(LogFileName, "Payload hash", payload_hash)
		  
		  var Headers() as AWS_Request_Header
		  for each item as AWS_Request_Header in UserHeaders
		    Headers.Append(item.clone())
		    
		  next
		  
		  Headers.Append(new AWS_Request_Header("host" ,Host, True))
		  Headers.Append(new AWS_Request_Header("x-amz-content-sha256", payload_hash, True))
		  Headers.Append(new AWS_Request_Header("x-amz-date",formatted_timestamp, True))
		  
		  
		  app.write_s3_sep(LogFileName,"Request headers")
		  
		  for each item as AWS_Request_Header in Headers
		    var kv as string = " "
		    if item.AddToSignature then kv="*"
		    app.write_s3_log(LogFileName, kv + item.Name, item.Value)
		    
		  next
		  
		  
		  var tmp_method as string = HTTPMethod
		  var tmp_host as string = Host
		  var tmp_uri as string = URI
		  
		  var tmp_authorization as String = self.GetAuthorisationStr(tmp_method, tmp_host, tmp_uri, QueryParams, Headers, payload_hash, self.RequestDateTime)
		  
		  var ct as new URLConnection
		  
		  
		  ct.ClearRequestHeaders
		  
		  ct.requestHeader("User-Agent") = "Mozilla/5.0"
		  ct.requestHeader("Date") = TimeStampRFC7231(self.RequestDateTime)
		  ct.requestHeader("Authorization") =  tmp_authorization
		  
		  for each header as AWS_Request_Header in headers
		    ct.requestHeader(header.Name) =  header.Value
		    
		  next
		  
		  if payload.Len>0 then
		    ct.SetRequestContent(payload, "application/text")
		    
		  end if
		  
		  
		  
		  app.write_s3_sep(LogFileName, "REQUEST")
		  
		  var url as string = "https://" +  host + UriEncode(uri, true) ' "s3.eu-west-3.amazonaws.com"
		  
		  var timeout as integer = 30
		  var reply as new AWS_Reply
		  
		  app.write_s3_log(LogFileName, "HTTPMethod", HTTPMethod)
		  app.write_s3_log(LogFileName, "URL", url)
		  
		  app.write_s3_sep(LogFileName,"")
		  
		  reply.ReplyText = ct.SendSync(HTTPMethod, url, timeout)
		  
		  For Each header As Pair In ct.ResponseHeaders
		    reply.Header(header.Left) = header.Right
		    
		  Next 
		  
		  return reply
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStampISO8601Format(param as date) As string
		  var d as  date = param
		  
		  d.GMTOffset =0
		  
		  return  _
		  format(d.year,"0000") _
		  + format(d.month, "00") _
		  + format(d.day, "00") _
		  + "T" _
		  + format(d.Hour,"00") _
		  + format(d.Minute,"00") _
		  + format(d.Second,"00") _
		  + "Z"
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStampRFC7231(param as date) As String
		  var d as  date = param
		  
		  '
		  ' See RFC7231
		  '
		  ' see https://developer.mozilla.org/fr/docs/Web/HTTP/Headers/Date
		  ' Date: <day-name>, <jour> <mois> <année> <heure>:<minute>:<seconde> GMT
		  
		  var ret() as String
		  
		  var tmp_src as string 
		  var tmp_dow() as String 
		  var tmp_month() as string
		  
		  
		  tmp_src = ",Sun,Mon,Tue,Wed,Thu,Fri,Sat,Sun"
		  tmp_dow = tmp_src.split(",")
		  
		  tmp_src = ",Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec"
		  tmp_month = tmp_src.split(",")
		  
		  d.GMTOffset = 0
		  
		  ret.append(tmp_dow(d.DayOfWeek)+",")
		  ret.append(format(d.Day,"00"))
		  ret.append(tmp_month(d.Month))
		  ret.append(format(d.year,"0000"))
		  
		  ret.Append(format(d.Hour, "00") + ":" + format(d.Minute,"00")+":"+format(d.Second,"00"))
		  
		  ret.append ("GMT")
		  
		  return join(ret," ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStampYYYYMMDD(param as date) As string
		  var d as  date = param
		  
		  d.GMTOffset =0
		  
		  return  _
		  format(d.year,"0000") _
		  + format(d.month, "00") _
		  + format(d.day, "00") 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UriEncode(param as String, protectSlash as Boolean=False) As string
		  '
		  ' Uri encode function, as per AWS specifications
		  '
		  var tmpin as string = param
		  var tmpout as string
		  
		  var no_encode as string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~"
		  
		  if protectSlash then
		    no_encode = no_encode + "/"
		    
		  end if
		  
		  
		  for i as integer = 1 to tmpin.lenb
		    var c as string = tmpin.midb(i,1)
		    if no_encode.InStr(c) > 0 then
		      tmpout = tmpout + c
		      
		    else
		      tmpout = tmpout + "%" + asc(c).ToHex(2).Uppercase()
		      
		    end if
		    
		  next
		  
		  return tmpout
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AWSAccessKeyId As string
	#tag EndProperty

	#tag Property, Flags = &h0
		AWSRegion As string
	#tag EndProperty

	#tag Property, Flags = &h0
		AWSSecretAccessKey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		AWSService As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CanonicalRequestElements() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		LogFileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestDateTime As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		StringToSignElements() As String
	#tag EndProperty


	#tag ViewBehavior
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
