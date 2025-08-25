#tag Class
Protected Class AWS_S3_PutObject
Inherits AWS_Common_Request
	#tag Method, Flags = &h0
		Sub Constructor(theBucket as string, theObjectKey as string, theObjectBody as string)
		  //
		  // Requests to put an object in a bucket
		  //
		  // Paramters:
		  // - name of the bucket
		  // - name of the object
		  // - body of the object
		  //
		  
		  
		  Super.Constructor
		  BucketName = theBucket
		  ObjectKey = theObjectKey
		  ObjectBody = theObjectBody
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(server as AWS_Common_Host) As string
		  //
		  // sends the request to put the object specified when calling the constructor
		  // returns the object as a string
		  //
		  // Parameters:
		  //.     - server to send the request to
		  //
		  //
		  // Returns:
		  //  Object received from the server or an empty string
		  //
		  
		  dim tmp_host_prefix as string = self.BucketName + "." 
		  
		  self.URI = self.ObjectKey
		  
		  if self.URI.left(1) <> "/" then
		    self.URI = "/" + self.URI
		    
		  end if
		  
		  // need to update the default http method 
		  super.UpdateHTTPMethod("PUT")
		  self.SetPayload( self.ObjectBody)
		  self.UserRequestHeaders.Add( new AWS_Request_Header("Content-length",str(self.ObjectBody.Len), False))
		  super.SendRequest(server,tmp_host_prefix)
		  
		  return DefineEncoding(self.ReplyText, Encodings.UTF8)
		  // 
		  // if self.ReplyXMLDoc = nil and len(self.ReplyText)>0 then
		  // return DefineEncoding(self.ReplyText, Encodings.UTF8)
		  // 
		  // else
		  // return ""
		  // 
		  // end if
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BucketName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ObjectBody As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ObjectKey As String
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
			Name="ObjectKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="ObjectBody"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
