#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent


	#tag Note, Name = Untitled
		http://aws-signature.com.s3-website-us-west-2.amazonaws.com
		
		
		
		URL with Querystring
		https://s3.eu-west-3.amazonaws.com/MyObject_2025-08-24
		
		Date
		August 26, 2025 00:36:00
		
		Method
		PUT
		
		Timeout (optional for header signing)
		60
		
		Algo
		AWS4-HMAC-SHA256
		
		AWS Service
		S3
		
		Secret Key
		wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY
		
		Access Key
		AKIDEXAMPLE
		
		Region
		eu-west-3
		
		Headers
		Host:s3.eu-west-3.amazonaws.com
		Content-Type:application/text; charset=utf-8
		X-Amz-Date:20250826T003600Z
		
		Payload
		Un petit train
		
		Auth Header
		Authorization: AWS4-HMAC-SHA256 Credential=AKIDEXAMPLE/20250826/eu-west-3/S3/aws4_request, SignedHeaders=content-type;host;x-amz-date, Signature=33e0886e435cb229c4e13a924842e15b9420b4507aabc82783c133e776648664
		
		//===
		Payload hash
		95d58a56206f6b345f06ba422a0faab7bb314a69dd77a4672e7f7bb2815a1af7
		
		Canonical request
		
		  Method
		  PUT
		
		  URI
		  /MyObject_2025-08-24
		
		  Canonical query string
		  (empty)
		
		  Canonical headers
		  content-type:application/text; charset=utf-8
		  host:s3.eu-west-3.amazonaws.com
		  x-amz-date:20250826T003600Z
		
		  content-type;host;x-amz-date
		  95d58a56206f6b345f06ba422a0faab7bb314a69dd77a4672e7f7bb2815a1af7
		
		Hash canonical request
		228846111451fc7cb193350591ffa356782e7ea33ff7e5505ccd37d5c95c2570
		
		String to sign
		AWS4-HMAC-SHA256
		20250825T223600Z
		20250826/eu-west-3/S3/aws4_request
		228846111451fc7cb193350591ffa356782e7ea33ff7e5505ccd37d5c95c2570
		
		Signing key
		144379afb5d37c43c154b8dcbe173fda5e9eb77a222d11e88ddce2a6d1879e77
		
		Signature
		33e0886e435cb229c4e13a924842e15b9420b4507aabc82783c133e776648664
		
		
		Auth header
		Authorization: AWS4-HMAC-SHA256 Credential=AKIDEXAMPLE/20250826/eu-west-3/S3/aws4_request, SignedHeaders=content-type;host;x-amz-date, Signature=33e0886e435cb229c4e13a924842e15b9420b4507aabc82783c133e776648664
		
		
		
		
		
		
		
	#tag EndNote


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
