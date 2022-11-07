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
		Sub SendRequest(server as AWS_Common, host_prefix as string)
		  
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


	#tag Note, Name = Untitled
		
		HTTPMethod as string, Host as string, URI as String, QueryParams as dictionary, UserHeaders() as AWS_Request_Header, payload as string
	#tag EndNote


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
