#tag Class
Protected Class AWS_S3_ListBuckets
Inherits AWS_Common_Request
	#tag Method, Flags = &h0
		Sub Constructor()
		  //
		  // Requests to get the list of buckets
		  //
		  // Paramters:
		  // - name of the bucket
		  // - name of the object
		  //
		  
		  Super.Constructor
		  self.ExpectedReplyName = "ListAllMyBucketsResult"
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ExtractBucketListFromXML(theXMLDoc as XMLDocument) As AWS_S3_Item()
		  const ExpectedXMLName as string = "ListAllMyBucketsResult"
		  
		  var retList() as AWS_S3_item
		  
		  var tmp_xml_doc As XmlDocument = theXMLDoc
		  
		  if tmp_xml_doc.FirstChild.name <> ExpectedXMLName then
		    return retList
		    
		  end if
		  
		  
		  var ownerID as string
		  
		  var nodes As XmlNodeList
		  
		  nodes = tmp_xml_doc.XQL("//Owner")
		  
		  for i as integer = 0 to nodes.Length-1
		    var  node as XmlNode = nodes.item(i)
		    ownerID = GetValueFromXMLNode(node,"ID")
		    
		  next
		  
		  
		  nodes = tmp_xml_doc.XQL("//Bucket")
		  
		  for i as integer = 0 to nodes.Length-1
		    var  node as XmlNode = nodes.item(i)
		    
		    var obj as new AWS_S3_item
		    obj.Name = GetValueFromXMLNode(node, "Name")
		    obj.CreationDateStr= GetValueFromXMLNode(node, "CreationDate")
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
		  //
		  // sends the request to get the list of buckets
		  // returns the list of buckets
		  //
		  // Parameters:
		  //.     - server to send the request to
		  //
		  //
		  // Returns:
		  //  List of buckets as an array of AWS_S3_Item
		  //
		  
		  var tmp() as AWS_S3_item
		  
		  super.SendRequest(server,"")
		  
		  if self.ReplyXMLDoc <> nil and self.GetXMLReplyName() = self.ExpectedReplyName then
		    
		    tmp = ExtractBucketListFromXML(self.ReplyXMLDoc)
		    
		  end if
		  
		  return tmp
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
