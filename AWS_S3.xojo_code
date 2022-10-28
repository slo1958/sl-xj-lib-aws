#tag Class
Protected Class AWS_S3
Inherits AWS_Common
	#tag Method, Flags = &h0
		Sub Constructor(credentials as Dictionary)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(theAWSAccessKeyId as string, theAWSSecretKey as string, theRegion as string="us-east-1") -- From AWS_Common
		  // Constructor(credentials as Dictionary) -- From AWS_Common
		  Super.Constructor(credentials)
		  
		  AWSService = "s3"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theAWSAccessKeyId as string, theAWSSecretKey as string, theRegion as string="us-east-1")
		  // Calling the overridden superclass constructor.
		  Super.Constructor(theAWSAccessKeyId, theAWSSecretKey, theRegion)
		  
		  AWSService = "s3"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractBucketListFromXML(theXMLStr as String) As AWS_S3_Item()
		  
		  dim retList() as AWS_S3_item
		  
		  dim tmp_xml_str as String = theXMLStr
		  
		  Dim tmp_xml_doc As New XmlDocument( tmp_xml_str )
		  
		  dim ownerID as string
		  
		  Dim nodes As XmlNodeList
		  
		  nodes = tmp_xml_doc.XQL("//Owner")
		  
		  for i as integer = 0 to nodes.Length-1
		    dim  node as XmlNode = nodes.item(i)
		    ownerID = self.GetValueFromXMLNode(node,"ID")
		    
		  next
		  
		  
		  nodes = tmp_xml_doc.XQL("//Bucket")
		  
		  for i as integer = 0 to nodes.Length-1
		    dim  node as XmlNode = nodes.item(i)
		    
		    dim obj as new AWS_S3_item
		    obj.Name = self.GetValueFromXMLNode(node, "Name")
		    obj.CreationDate= self.GetValueFromXMLNode(node, "CreationDate")
		    obj.Owner = ownerID
		    
		    if obj.Name.Len > 0 then
		      retList.Append(obj)
		      
		    end if
		    
		  next
		  
		  return retList
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractObjectInfoFromXML(theXMLStr as String) As AWS_S3_item()
		  
		  dim retList() as AWS_S3_item
		  
		  dim tmp_xml_str as String = theXMLStr
		  
		  Dim tmp_xml_doc As New XmlDocument( tmp_xml_str )
		  
		  
		  Dim nodes As XmlNodeList
		  nodes = tmp_xml_doc.XQL("//Contents")
		  
		  
		  for i as integer = 0 to nodes.Length-1
		    dim  node as XmlNode = nodes.item(i)
		    
		    dim obj as new AWS_S3_item
		    obj.Name = self.GetValueFromXMLNode(node, "Key")
		    obj.ModificationDate= self.GetValueFromXMLNode(node, "LastModified")
		    obj.Size = val(self.GetValueFromXMLNode(node,"Size"))
		    obj.StorageClass =  self.GetValueFromXMLNode(node, "StorageClass")
		    obj.Owner = self.GetValueFromXMLNode(self.GetChildNodeFromXMLNode(node,"Owner"), "ID")
		    
		    if obj.Name.Len > 0 then
		      retList.Append(obj)
		      
		    end if
		    
		  next
		  
		  return retList
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetObject(theBucket as string, theObjectKey as string) As String
		  
		  dim tmp as string
		  
		  dim tmp_http_method as string = "GET"
		  dim tmp_host as string = theBucket + "." + self.getHost
		  dim tmp_uri as string = theObjectKey
		  
		  dim tmp_query_params as new Dictionary
		  dim tmp_headers() as AWS_Request_Header
		  dim tmp_payload as string
		  
		  if tmp_uri.left(1) <> "/" then
		    tmp_uri = "/" + tmp_uri
		    
		  end if
		  
		  
		  tmp = Request(tmp_http_method, tmp_host, tmp_uri, tmp_query_params, tmp_headers, tmp_payload)
		  
		  return DefineEncoding(tmp, Encodings.UTF8)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function listBuckets() As string
		  
		  dim tmp as string
		  
		  dim tmp_http_method as string = "GET"
		  dim tmp_host as string = self.getHost
		  dim tmp_uri as string = "/"
		  dim tmp_query_params as new Dictionary
		  dim tmp_headers() as AWS_Request_Header
		  dim tmp_payload as string
		  
		  
		  tmp = Request(tmp_http_method, tmp_host, tmp_uri, tmp_query_params, tmp_headers, tmp_payload)
		  
		  return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function listObjectsInBucket(theBucket as string) As string
		  
		  dim tmp as string
		  
		  dim tmp_http_method as string = "GET"
		  dim tmp_host as string = theBucket + "." + self.getHost()
		  dim tmp_uri as string = "/"
		  dim tmp_query_params as new Dictionary
		  dim tmp_headers() as AWS_Request_Header
		  dim tmp_payload as string
		  
		  
		  tmp = Request(tmp_http_method, tmp_host, tmp_uri, tmp_query_params, tmp_headers, tmp_payload)
		  
		  return tmp
		  
		End Function
	#tag EndMethod


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
