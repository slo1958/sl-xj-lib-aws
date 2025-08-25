#tag Class
Protected Class AWS_S3_ListObjectsInBucket
Inherits AWS_Common_Request
	#tag Method, Flags = &h0
		Sub Constructor(theBucket as string)
		  //
		  // Requests to get the list of objects from a bucket
		  //
		  // Paramters:
		  // - name of the bucket
		  //
		  
		  Super.Constructor
		  BucketName = theBucket
		  self.ExpectedReplyName = "ListBucketResult"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ExtractObjectInfoFromXML(theXMLDoc as XMLDocument) As AWS_S3_item()
		  const ExpectedXMLName as string = "ListBucketResult"
		  
		  var retList() as AWS_S3_item
		  
		  var tmp_xml_doc As  XmlDocument = theXMLDoc
		  
		  
		  if tmp_xml_doc.FirstChild.name <> ExpectedXMLName then
		    return retList
		    
		  end if
		  
		  
		  var nodes As XmlNodeList
		  nodes = tmp_xml_doc.XQL("//Contents")
		  
		  
		  for i as integer = 0 to nodes.Length-1
		    var  node as XmlNode = nodes.item(i)
		    
		    var obj as new AWS_S3_item
		    obj.Name = GetValueFromXMLNode(node, "Key")
		    obj.ModificationDateStr= GetValueFromXMLNode(node, "LastModified")
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
		Function SendRequest(server as AWS_Common_Host) As AWS_S3_Item()
		  //
		  // sends the request to get the list of objects in the bucket specified when calling the constructor
		  // returns the object as a string
		  //
		  // Parameters:
		  //.     - server to send the request to
		  //
		  //
		  // Returns:
		  //  List of objects received from the server as an array of AWS_S3_Item
		  //
		  
		  var tmp() as AWS_S3_item
		  
		  var tmp_host_prefix as string = self.BucketName + "." 
		  
		  super.SendRequest(server, tmp_host_prefix)
		  
		  if self.ReplyXMLDoc <> nil and self.GetXMLReplyName() = self.ExpectedReplyName then
		    tmp = ExtractObjectInfoFromXML(self.ReplyXMLDoc)
		    
		  end if
		  
		  return tmp
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BucketName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BucketName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExpectedReplyName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPMethod"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReplyText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequestPayload"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="URI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
