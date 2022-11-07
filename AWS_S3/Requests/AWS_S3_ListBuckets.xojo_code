#tag Class
Protected Class AWS_S3_ListBuckets
Inherits AWS_Common_Request
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ExtractBucketListFromXML(theXMLStr as String) As AWS_S3_Item()
		  
		  dim retList() as AWS_S3_item
		  
		  dim tmp_xml_str as String = theXMLStr
		  
		  Dim tmp_xml_doc As New XmlDocument( tmp_xml_str )
		  
		  dim ownerID as string
		  
		  Dim nodes As XmlNodeList
		  
		  nodes = tmp_xml_doc.XQL("//Owner")
		  
		  for i as integer = 0 to nodes.Length-1
		    dim  node as XmlNode = nodes.item(i)
		    ownerID = GetValueFromXMLNode(node,"ID")
		    
		  next
		  
		  
		  nodes = tmp_xml_doc.XQL("//Bucket")
		  
		  for i as integer = 0 to nodes.Length-1
		    dim  node as XmlNode = nodes.item(i)
		    
		    dim obj as new AWS_S3_item
		    obj.Name = GetValueFromXMLNode(node, "Name")
		    obj.CreationDate= GetValueFromXMLNode(node, "CreationDate")
		    obj.Owner = ownerID
		    
		    if obj.Name.Len > 0 then
		      retList.Append(obj)
		      
		    end if
		    
		  next
		  
		  return retList
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(server as AWS_Common_Host) As AWS_S3_Item()
		  dim tmp() as AWS_S3_item
		  
		  super.SendRequest(server,"")
		  
		  if len(self.ReplyText)>0 then
		    tmp = ExtractBucketListFromXML(self.ReplyText)
		    
		  end if
		  
		  return tmp
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="HTTPMethod"
			Group="Behavior"
			Type="String"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequestPayload"
			Group="Behavior"
			Type="string"
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
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
