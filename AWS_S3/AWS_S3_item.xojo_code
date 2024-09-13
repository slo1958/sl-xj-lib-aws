#tag Class
Protected Class AWS_S3_item
	#tag Method, Flags = &h0
		Sub Constructor(theName as string = "")
		  self.Name = theName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreationDate() As DateTime
		  
		  return self.DateToXojoDate(self.CreationDateStr)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DateToXojoDate(dateStr as string) As DateTime
		  
		  var date_and_time() as string = dateStr.Split("T")
		  
		  if date_and_time.LastIndex < 1 then return nil
		  
		  var time_and_zone() as string = date_and_time(1).Split(".")
		  
		  if time_and_zone.LastIndex < 0 then return nil
		  
		  var sqldatetime as string = date_and_time(0) + " " + time_and_zone(0)
		  
		  var d as  DateTime = DateTime.FromString(sqldatetime, nil, new TimeZone("GMT"))
		  
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ModificationDate() As DateTime
		  return self.DateToXojoDate( self.ModificationDateStr)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CreationDateStr As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ModificationDateStr As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Owner As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Size As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StorageClass As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CreationDateStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
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
			Name="ModificationDateStr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
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
			Name="Name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Owner"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Size"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StorageClass"
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
	#tag EndViewBehavior
End Class
#tag EndClass
