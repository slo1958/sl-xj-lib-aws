#tag Class
Protected Class AWS_Common
	#tag Method, Flags = &h0
		Shared Function ComputeBlockSizedKey(key as MemoryBlock, blockSize as integer) As MemoryBlock
		  
		  
		  dim tmp_key as MemoryBlock = key
		  dim tmp_out as MemoryBlock
		  
		  
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
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theAWSAccessKeyId as string, theAWSSecretKey as string, theRegion as string="us-east-1")
		  AWSAccessKeyId = theAWSAccessKeyId.trim()
		  AWSSecretAccessKey = theAWSSecretKey.trim()
		  AWSRegion = theRegion.trim() 
		  AWSService = "??"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAuthorisationStr(HTTPMethod as string, Host as string, URI as String, QueryParams as dictionary, Headers() as AWS_Request_Header, payload_hash as string, RequestTime as date) As String
		  '
		  ' Header contains the AWS specific headers
		  ' 
		  dim tmp_canonical_request as string = self.GetCanonicalRequest(HTTPMethod, URI, QueryParams, Headers, payload_hash)
		  
		  dim tmp_signature as string = self.GetSignature(RequestTime, tmp_canonical_request)
		  
		  dim tmp_signedheaders as string = self.GetListSignedHeaders(Headers)
		  
		  dim tmp_auth_str as string
		  
		  dim tmp_credential_elements() as string
		  tmp_credential_elements.append(self.AWSAccessKeyId)
		  tmp_credential_elements.append(self.TimeStampYYYYMMDD(RequestTime))
		  tmp_credential_elements.append(self.AWSRegion)
		  tmp_credential_elements.append(self.AWSService)
		  tmp_credential_elements.append("aws4_request")
		  
		  dim tmp_credential as string = join(tmp_credential_elements,"/")
		  
		  tmp_auth_str = self.HashingType
		  tmp_auth_str = tmp_auth_str + " "
		  
		  tmp_auth_str = tmp_auth_str + "Credential=" + tmp_credential
		  tmp_auth_str = tmp_auth_str + ","
		  
		  tmp_auth_str = tmp_auth_str + "SignedHeaders="+tmp_signedheaders
		  tmp_auth_str = tmp_auth_str + ","
		  tmp_auth_str = tmp_auth_str + "Signature="+tmp_signature
		  
		  return tmp_auth_str
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalHeaders(Headers() as AWS_Request_Header) As String
		  dim tmp_list() as string
		  dim tmp_dct as new Dictionary
		  dim tmp_elements() as string
		  
		  for each header as AWS_Request_Header in Headers
		    dim tmp_name as string =  header.Name.Lowercase()
		    tmp_list.Append(tmp_name)
		    tmp_dct.Value(tmp_name) = header
		  next
		  
		  tmp_list.sort()
		  
		  for each name as string in tmp_list
		    dim header as AWS_Request_Header = tmp_dct.Value(name)
		    tmp_elements.Append(name+":"+header.Value.trim())
		    
		  next
		  
		  return join(tmp_elements, chr(10))+chr(10)
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCanonicalQueryStr(theQueryParams as Dictionary) As string
		  
		  dim dct as Dictionary = theQueryParams
		  dim tmp_list() as string
		  dim tmp_elements() as string
		  
		  for each k as string in dct.Keys
		    tmp_list.Append(k)
		    
		  next
		  
		  tmp_list.sort
		  
		  for each k as String in tmp_list
		    dim v as string = dct.Value(k)
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
		  
		  
		  dim CanonicalURI as string = UriEncode(URI, True)
		  dim CanonicalQueryStr as string = self.GetCanonicalQueryStr(QueryParams)
		  dim CanonicalHeaders as string = self.GetCanonicalHeaders(headers)
		  dim SignedHeaders as String = self.GetListSignedHeaders(headers)
		  
		  dim tmp_elements() as string
		  
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
		  dim tmp_src_node as XmlNode = theNode
		  
		  dim ret_value as XmlNode
		  
		  dim tmp_wrk_node as XmlNode = tmp_src_node.FirstChild
		  
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
		  
		  dim payload as string = thePayload
		  
		  dim v as MemoryBlock = Crypto.SHA256(payload)
		  
		  return AWS_S3.MemoryBlockToHex(v).Lowercase()
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
		  dim tmp_list() as string 
		  
		  for each header as AWS_Request_Header in Headers
		    if header.AddToSignature then
		      dim tmp_name as string =  header.Name.Lowercase()
		      tmp_list.Append(tmp_name)
		    end if
		    
		  next
		  
		  tmp_list.sort()
		  
		  return join(tmp_list,";")
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetQueryStr(theQueryParams as Dictionary) As string
		  
		  dim dct as Dictionary = theQueryParams
		  dim tmp_list() as string
		  dim tmp_elements() as string
		  
		  for each k as string in dct.Keys
		    tmp_list.Append(k)
		    
		  next
		  
		  tmp_list.sort
		  
		  for each k as String in tmp_list
		    dim v as string = dct.Value(k)
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
		  
		  dim tmp_hashType as string = self.HashingType
		  
		  dim tmp_date as date = theDate
		  dim tmp_CanonicalRequest as String = theCanonicalRequest
		  
		  dim fmt_date as string = self.TimeStampISO8601Format(tmp_date)
		  dim fmt_date_short as String = self.TimeStampYYYYMMDD(tmp_date)
		  dim fmt_scope as string = fmt_date_short +"/" + self.AWSRegion + "/"+ self.AWSService + "/aws4_request"
		  dim hashed_request as String = MemoryBlockToHex(Crypto.SHA256(tmp_CanonicalRequest)).Lowercase()
		  
		  dim tmp_elements() as String
		  
		  tmp_elements.Append(tmp_hashType)
		  tmp_elements.Append(fmt_date)
		  tmp_elements.Append(fmt_scope)
		  tmp_elements.Append(hashed_request)
		  
		  ' Save in property for debugging purposes
		  self.StringToSignElements = tmp_elements
		  
		  dim StringToSign as string = join(tmp_elements, chr(10))
		  
		  'signing key = HMAC-SHA256(HMAC-SHA256(HMAC-SHA256(HMAC-SHA256("AWS4" + "<YourSecretAccessKey>","20130524"),"us-east-1"),"s3"),"aws4_request")
		  
		  dim tmp0_secret as String = "AWS4"+self.AWSSecretAccessKey
		  dim tmp1_date as MemoryBlock = HMAC_SHA256(tmp0_secret, fmt_date_short)
		  dim tmp2_region as MemoryBlock = HMAC_SHA256(tmp1_date, self.AWSRegion)
		  dim tmp3_service as MemoryBlock = HMAC_SHA256(tmp2_region, self.AWSService)
		  dim tmp4_request as MemoryBlock = HMAC_SHA256(tmp3_service, "aws4_request")
		  dim tmp5_signature as string = MemoryBlockToHex(HMAC_SHA256(tmp4_request, StringToSign)).Lowercase()
		  
		  return tmp5_signature
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetValueFromXMLNode(theNode as XMLNode, theItem as string) As String
		  dim tmp_src_node as XmlNode = theNode
		  
		  dim ret_value as String
		  dim tmp_wrk_node as XmlNode = tmp_src_node.FirstChild
		  
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
		  
		  dim i_key_mask as UInt64 = &h3636363636363636
		  dim o_key_mask as UInt64 = &h5C5C5C5C5C5C5C5C
		  
		  dim tmp_key as MemoryBlock = theKey
		  dim tmp_str as String = theSource
		  
		  dim len_str as integer = len(tmp_str)
		  
		  dim mb_input as new MemoryBlock(len_str+1)
		  dim mb_output as MemoryBlock
		  
		  mb_input = tmp_str
		  
		  dim base_key as MemoryBlock = computeBlockSizedKey(tmp_key, BlockSize)
		  
		  dim i_key_pad as new MemoryBlock(BlockSize + len_str )
		  dim o_key_pad as new MemoryBlock(BlockSize + OutputSize)
		  
		  
		  for i as integer = 0 to BlockSize-1 step 8
		    i_key_pad.UInt64Value(i) = BitwiseXor( base_key.UInt64Value(i) , i_key_mask )
		    o_key_pad.UInt64Value(i) = BitwiseXor( base_key.UInt64Value(i) , o_key_mask )
		  next
		  
		  for i as integer = BlockSize to BlockSize + len_str-1
		    i_key_pad.UInt8Value(i) = mb_input.UInt8Value(i-BlockSize)
		    
		  next
		  
		  dim mb_temp as MemoryBlock = Crypto.SHA256(i_key_pad)
		  
		  for i as integer = BlockSize to BlockSize + OutputSize -1
		    o_key_pad.UInt8Value(i) = mb_temp.UInt8Value(i-BlockSize)
		    
		  next
		  
		  mb_output = Crypto.SHA256(o_key_pad)
		  
		  return mb_output
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LoadCredentials(credentials_group as string = "default") As Dictionary
		  dim search_str as string = credentials_group
		  
		  dim dct as new Dictionary
		  
		  dim txt_buffer as string = credentials.ReplaceAll(chr(13), chr(10))
		  dim lines_buffer() as string = txt_buffer.Split(chr(10))
		  dim parts() as string
		  
		  dim section_found as boolean = false
		  
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
		  dim tmp as string
		  
		  for i as integer = 0 to m.Size-1
		    dim tmp_int as integer = m.UInt8Value(i)
		    tmp = tmp + tmp_int.ToHex(2)
		  next
		  
		  return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Request(HTTPMethod as string, Host as string, URI as String, QueryParams as dictionary, UserHeaders() as AWS_Request_Header, payload as string) As AWS_Reply
		  
		  self.RequestDateTime = new date()
		  
		  '
		  ' Add AWS headers
		  '
		  
		  dim payload_hash as string = self.GetHashedPayload(payload)
		  dim formatted_timestamp as string = self.TimeStampISO8601Format(self.RequestDateTime)
		  
		  Dim Headers() as AWS_Request_Header
		  for each item as AWS_Request_Header in UserHeaders
		    Headers.Append(item.clone())
		    
		  next
		  
		  
		  Headers.Append(new AWS_Request_Header("host" ,Host, True))
		  Headers.Append(new AWS_Request_Header("x-amz-content-sha256", payload_hash, True))
		  Headers.Append(new AWS_Request_Header("x-amz-date",formatted_timestamp, True))
		  
		  dim tmp_method as string = HTTPMethod
		  dim tmp_host as string = Host
		  dim tmp_uri as string = URI
		  
		  dim tmp_authorization as String = self.GetAuthorisationStr(tmp_method, tmp_host, tmp_uri, QueryParams, Headers, payload_hash, self.RequestDateTime)
		  
		  
		  dim ct as new HTTPSecureSocket
		  ct.ClearRequestHeaders
		  ct.requestHeaders.AppendHeader("User-Agent","Mozilla/5.0")
		  ct.requestHeaders.AppendHeader("Date",TimeStampRFC7231(self.RequestDateTime))
		  ct.requestHeaders.AppendHeader("Authorization", tmp_authorization)
		  
		  for each header as AWS_Request_Header in headers
		    ct.requestHeaders.AppendHeader(header.Name, header.Value)
		    
		  next
		  
		  dim url as string = host + uri ' "s3.eu-west-3.amazonaws.com"
		  
		  dim timeout as integer = 30
		  dim reply as new AWS_Reply
		  
		  reply.ReplyText = ct.SendRequest(HTTPMethod, url, timeout)
		  reply.Headers= ct.PageHeaders
		  
		  return reply
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStampISO8601Format(param as date) As string
		  dim d as  date = param
		  
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
		  dim d as  date = param
		  
		  '
		  ' See RFC7231
		  '
		  ' see https://developer.mozilla.org/fr/docs/Web/HTTP/Headers/Date
		  ' Date: <day-name>, <jour> <mois> <année> <heure>:<minute>:<seconde> GMT
		  
		  dim ret() as String
		  
		  dim tmp_src as string 
		  dim tmp_dow() as String 
		  dim tmp_month() as string
		  
		  
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
		  dim d as  date = param
		  
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
		  dim tmpin as string = param
		  dim tmpout as string
		  
		  dim no_encode as string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~"
		  
		  if protectSlash then
		    no_encode = no_encode + "/"
		    
		  end if
		  
		  
		  for i as integer = 1 to tmpin.lenb
		    dim c as string = tmpin.midb(i,1)
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
		RequestDateTime As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		StringToSignElements() As String
	#tag EndProperty


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
