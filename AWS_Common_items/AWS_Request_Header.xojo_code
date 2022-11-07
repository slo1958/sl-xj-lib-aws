#tag Class
Protected Class AWS_Request_Header
	#tag Method, Flags = &h0
		Function Clone() As AWS_Request_Header
		  Return new AWS_Request_Header(self.Name, Self.Value, Self.AddToSignature)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theName as string, theValue as String, IncludeInSignature as Boolean)
		  self.Name = theName
		  self.Value = theValue
		  self.AddToSignature = IncludeInSignature
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AddToSignature As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AddToSignature"
			Group="Behavior"
			Type="Boolean"
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
			Name="Name"
			Group="Behavior"
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
		#tag ViewProperty
			Name="Value"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
