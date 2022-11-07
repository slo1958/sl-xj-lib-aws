#tag Class
Protected Class AWS_Common_Request
	#tag Method, Flags = &h0
		Sub Constructor()
		  HTTPMethod = "GET"
		  URI = "/"
		  QueryParams = new Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DecodeError(theXMLStr as String) As string
		  ' <?xml version=""1.0"" encoding=""UTF-8""?><Error><Code>NoSuchBucket</Code><Message>The specified bucket does not exist</Message><BucketName>sl58-aws-bucket-001kk</BucketName><RequestId>2DPRQCN9JMZG10G7</RequestId><HostId>42ZoaPcOc+06Vc7WP4bAzj7JPtj9Pnb9lJGZbM2b/nIPeI8IWTLCp1vjRnBbqJb66E/WjqKcHnRpZi7SwT9K+g==</HostId></Error>
		  
		  const XMLStrStart as String = "<?xml version=""1.0"" encoding=""UTF-8""?><Error>"
		  
		  if left(theXMLStr, len(XMLStrStart)) <> XMLStrStart then
		    return ""
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DecodeTimeStamp(theTimeStamp as String) As date
		  'Mon, 07 Nov 2022 11:03:43 GMT
		  
		  dim tmp_timestamp as String = theTimeStamp.trim()
		  
		  dim tmp_arr() as string = tmp_timestamp.split(" ")
		  dim tmp_list_month() as String
		  
		  dim tmp_src as string =  ",Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec"
		  tmp_list_month = tmp_src.split(",")
		  
		  if tmp_arr.Ubound < 5 then
		    return nil
		  end if
		  
		  dim tmp_month as Integer = tmp_list_month.IndexOf(tmp_arr(2))
		  
		  if tmp_month <1 then
		    Return nil 
		    
		  end if
		  
		  if tmp_arr(5).Uppercase.trim() <> "GMT" then
		    return nil
		    
		  end if
		  
		  
		  dim tmp_day as integer = val(tmp_arr(1))
		  dim tmp_year as integer = val(tmp_arr(3))
		  
		  dim tmp_str as string =   _
		  format(tmp_year,"0000") _
		  + "-" _
		  + format(tmp_month, "00") _  
		  + "-" _
		  + format(tmp_day, "00") _
		  + " " _
		  + tmp_arr(4)
		  
		  dim d as new date
		  
		  d.GMTOffset = 0
		  d.SQLDateTime = tmp_str
		  
		  return d
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetChildNodeFromXMLNode(theNode as XMLNode, theChildName as string) As XmlNode
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
		Function GetContentLength() As integer
		  const header_key as string = "Content-Length"
		  
		  return Clong(self.GetReplyHeaderValue(header_key))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReplyDate() As Date
		  const header_key as string = "Date"
		  
		  dim tmp_str as string = self.GetReplyHeaderValue(header_key)
		  
		  dim tmp_date as date = DecodeTimeStamp(tmp_str)
		  
		  if tmp_date = nil then
		    tmp_date = new date(1900,1,1)
		    
		  end if
		  
		  return tmp_date 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReplyHeaderValue(theHeaderKey as String) As string
		  dim tmp As String
		  
		  tmp = self.ReplyHeaders.Value(theHeaderKey)
		  
		  return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRequestID() As string
		  const header_key as string = "x-amz-request-id"
		  
		  return self.GetReplyHeaderValue(header_key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRequestID2() As string
		  const header_key as string = "x-amz-id-2"
		  
		  return self.GetReplyHeaderValue(header_key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetValueFromXMLNode(theNode as XMLNode, theItem as string) As String
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
		Sub SendRequest(server as AWS_Common_Host, host_prefix as string)
		  
		  dim tmp_http_method as string = self.HTTPMethod
		  dim tmp_host as string = host_prefix + server.getHost
		  dim tmp_uri as string = self.URI
		  dim tmp_query_params as  Dictionary = self.QueryParams
		  dim tmp_headers() as AWS_Request_Header = self.UserRequestHeaders
		  
		  dim tmp_payload as string = self.RequestPayload
		  
		  dim tmp_reply as AWS_Reply
		  
		  tmp_reply = server.Request(tmp_http_method, tmp_host, tmp_uri, tmp_query_params, tmp_headers, tmp_payload)
		  
		  self.ReplyHeaders = tmp_reply.Headers
		  self.ReplyText = tmp_reply.ReplyText
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		HTTPMethod As String
	#tag EndProperty

	#tag Property, Flags = &h0
		QueryParams As dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ReplyHeaders As InternetHeaders
	#tag EndProperty

	#tag Property, Flags = &h0
		ReplyText As string
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestPayload As string
	#tag EndProperty

	#tag Property, Flags = &h0
		URI As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UserRequestHeaders() As AWS_Request_Header
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="HTTPMethod"
			Group="Behavior"
			Type="String"
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
			Name="ReplyText"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequestPayload"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="URI"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
