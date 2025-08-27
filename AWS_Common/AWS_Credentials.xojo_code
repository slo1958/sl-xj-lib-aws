#tag Class
Protected Class AWS_Credentials
	#tag Method, Flags = &h0
		Sub Constructor(credentials_group as string = "default")
		  
		  if credentials_group <> self.NoAutoLoad then reload(credentials_group)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCustomParameter(key as string) As string
		  //
		  // Retrieve a custom parameter from the loaded dictionary
		  //
		  
		  if LoadedDict = nil then return ""
		  
		  return self.LoadedDict.lookup(key, "")
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload(credentials_group as String)
		  //
		  // Credential file example:
		  //
		  // [default]
		  // aws_access_key_id = <access key_id>
		  // aws_secret_access_key = <access key secret>
		  // aws_region = <aws region>
		  // aws_provider = <aws_provider>
		  //
		  
		  var search_str as string = credentials_group
		  
		  var dct as new Dictionary
		  
		  var txt_buffer as string = credentials.ReplaceAll(chr(13), chr(10))
		  var lines_buffer() as string = txt_buffer.Split(chr(10))
		  var parts() as string
		  
		  var section_found as boolean = false
		  
		  for each line as string in lines_buffer
		    line = line.Trim()
		    
		    if line.length = 0 then
		      
		    elseif line = "[" + search_str +"]" then
		      section_found = True
		      
		    elseif line.left(1)="[" and line.right(1)="]" then
		      section_found = False
		      
		    elseif section_found then
		      parts = line.split("=")
		      
		      if parts.Ubound = 1 then
		        dct.Value(parts(0).trim) = parts(1).trim
		        
		      else
		        System.DebugLog("Ignoring " + line)
		        
		      end if
		      
		    else
		      
		    end if
		    
		  next
		  
		  self.AWSAccessKeyId = dct.lookup(aws_keyword_access_key_id,"").StringValue.trim()
		  self.AWSSecretAccessKey = dct.lookup(aws_keyword_secret_access_key,"").StringValue.trim()
		  self.AWSRegion = dct.lookup(aws_keyword_region, "").StringValue.trim()
		  self.AWSProvider = dct.Lookup(aws_keyword_provider, "").StringValue.trim()
		  
		  if self.AWSRegion.Length = 0 then self.AWSRegion = aws_default_region
		  if self.AWSProvider.length = 0 then self.AWSProvider = aws_default_provider
		  
		  System.DebugLog("Credential group" + credentials_group)
		  System.DebugLog("Access_key:" + dct.Lookup(aws_keyword_access_key_id,"(missing)"))
		  System.DebugLog("Region:" + dct.Lookup(aws_keyword_region,"(missing)"))
		  System.DebugLog("Provider:" + dct.Lookup(aws_keyword_provider,"(missing)"))
		  
		  LoadedDict =  dct
		  
		  return
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AWSAccessKeyId As string
	#tag EndProperty

	#tag Property, Flags = &h0
		AWSProvider As string
	#tag EndProperty

	#tag Property, Flags = &h0
		AWSRegion As string
	#tag EndProperty

	#tag Property, Flags = &h0
		AWSSecretAccessKey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		LoadedDict As Dictionary
	#tag EndProperty


	#tag Constant, Name = aws_default_provider, Type = String, Dynamic = False, Default = \"amazonaws.com", Scope = Public
	#tag EndConstant

	#tag Constant, Name = aws_default_region, Type = String, Dynamic = False, Default = \"us-east-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = aws_keyword_access_key_id, Type = String, Dynamic = False, Default = \"aws_access_key_id", Scope = Public
	#tag EndConstant

	#tag Constant, Name = aws_keyword_provider, Type = String, Dynamic = False, Default = \"aws_provider", Scope = Public
	#tag EndConstant

	#tag Constant, Name = aws_keyword_region, Type = String, Dynamic = False, Default = \"aws_region", Scope = Public
	#tag EndConstant

	#tag Constant, Name = aws_keyword_secret_access_key, Type = String, Dynamic = False, Default = \"aws_secret_access_key", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoAutoLoad, Type = String, Dynamic = False, Default = \"-!-!-", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSAccessKeyId"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSProvider"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSRegion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AWSSecretAccessKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LoadedDict"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
