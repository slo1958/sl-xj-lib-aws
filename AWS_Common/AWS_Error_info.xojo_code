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
		  
		  var tmp_node0 as XmlNode = theXmlDoc.FirstChild
		  
		  var tmp_node1 as XmlNode = tmp_node0.FirstChild
		  
		  while tmp_node1 <> nil 
		    var t1 as string = tmp_node1.Name
		    var t2 as String = tmp_node1.FirstChild.Value
		    var v1 as variant = tmp_node1.Value
		    
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
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
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
			Name="Message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
