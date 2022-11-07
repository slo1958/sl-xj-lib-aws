#tag Class
Protected Class AWS_S3_ListObjectsInBucket
Inherits AWS_Common_Request
	#tag Method, Flags = &h0
		Sub Constructor(theBucket as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  BucketName = theBucket
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ExtractObjectInfoFromXML(theXMLStr as String) As AWS_S3_item()
		  
		  dim retList() as AWS_S3_item
		  
		  dim tmp_xml_str as String = theXMLStr
		  
		  Dim tmp_xml_doc As New XmlDocument( tmp_xml_str )
		  
		  
		  Dim nodes As XmlNodeList
		  nodes = tmp_xml_doc.XQL("//Contents")
		  
		  
		  for i as integer = 0 to nodes.Length-1
		    dim  node as XmlNode = nodes.item(i)
		    
		    dim obj as new AWS_S3_item
		    obj.Name = GetValueFromXMLNode(node, "Key")
		    obj.ModificationDate= GetValueFromXMLNode(node, "LastModified")
		    obj.Size = val(GetValueFromXMLNode(node,"Size"))
		    obj.StorageClass =  GetValueFromXMLNode(node, "StorageClass")
		    obj.Owner = GetValueFromXMLNode(GetChildNodeFromXMLNode(node,"Owner"), "ID")
		    
		    if obj.Name.Len > 0 then
		      retList.Append(obj)
		      
		    end if
		    
		  next
		  
		  return retList
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(server as AWS_Common) As AWS_S3_Item()
		  dim tmp() as AWS_S3_item
		  
		  dim tmp_host_prefix as string = self.BucketName + "." 
		  
		  super.SendRequest(server, tmp_host_prefix)
		  
		  if len(self.ReplyText)>0 then
		    tmp = ExtractObjectInfoFromXML(self.ReplyText)
		    
		  end if
		  
		  return tmp
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BucketName As String
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
