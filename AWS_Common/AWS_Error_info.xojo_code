#tag Class
Protected Class AWS_Error_info
	#tag Method, Flags = &h0
		Sub Constructor(theXMLDoc as XMLDocument)
		  self.parameters = new Dictionary
		  
		  self.DecodeError(theXMLDoc)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecodeError(theXMLDoc as XMLDocument)
		  
		  dim tmp_node0 as XmlNode = theXmlDoc.FirstChild
		  
		  dim tmp_node1 as XmlNode = tmp_node0.FirstChild
		  
		  while tmp_node1 <> nil 
		    dim t1 as string = tmp_node1.Name
		    dim t2 as String = tmp_node1.FirstChild.Value
		    dim v1 as variant = tmp_node1.Value
		    
		    if t1.trim.Uppercase = "CODE" then
		      self.code = t2
		      
		    elseif t1.trim.Uppercase = "MESSAGE" then
		      self.Message = t2
		      
		    else
		      self.parameters.Value(t1)=t2
		    end   if
		    
		    tmp_node1 = tmp_node1.NextSibling
		    
		  wend
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			Public Property Code as String
		#tag EndNote
		Code As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Message As String
	#tag EndProperty

	#tag Property, Flags = &h0
		parameters As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Code"
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
