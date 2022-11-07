#tag Class
Protected Class AWS_S3_GetObject
Inherits AWS_Common_Host_Request
	#tag Method, Flags = &h0
		Sub Constructor(theBucket as string, theObjectKey as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  BucketName = theBucket
		  ObjectKey = theObjectKey
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(server as AWS_Common_Host) As String
		  
		  dim tmp_host_prefix as string = self.BucketName + "." 
		  
		  self.URI = self.ObjectKey
		  
		  if self.URI.left(1) <> "/" then
		    self.URI = "/" + self.URI
		    
		  end if
		  
		  super.SendRequest(server,tmp_host_prefix)
		  
		  if len(self.ReplyText)>0 then
		    return DefineEncoding(self.ReplyText, Encodings.UTF8)
		    
		  else
		    return ""
		    
		  end if
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BucketName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ObjectKey As String
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
