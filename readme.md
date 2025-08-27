# sl-xj-lib-aws
Xojo library to transfer objects to and from a AWS S3 bucket

The library is provided as is for free and it is available in a github repo. Please give credit to the author when applicable. 
In the unlikely case someone finds a bug ;), please use github to report the issue.


## Test/demo

Test program implementing a basic navigator.

To run the program, you need to create a text file named <b>credentials</b>
wtih the following content:

[default]</br>
aws\_access\_key\_id = (your access key)</br>
aws\_secret\_access\_key = (your secret key)</br>
aws\_region = (your region, for example eu-west-3)</br>
aws\_provider = (your provider, for example amazonaws.com)<br>

The test section uses fixed bucket name and file name. They are defined as constant in the definition of the WIndow1 object and must be updated.

You can define multiple credentials and use them in the code using their name:


[credentials1]</br>
aws\_access\_key\_id= …</br>
…</br>

[credentials2]</br>
aws\_access\_key\_id= …</br>
…</br>

And then update the call to the constructor of <b>AWS_Credentials</b> as follow:

Using the default values, calling the constructor without parameters:

```xojo

var s3_host as new AWS_S3_Host(new AWS_Credentials(), DefaultTraceMode)

```

Requesting a specific set of credentials: 

```xojo

var s3_host as new AWS_S3_Host(new AWS_Credentials(“credentials1”)), DefaultTraceMode)


```
The constructor of AWS_Credentials will load the credentials from the credentials file. You can prevent auto loading as follow:

```xojo

var s3_host as new AWS_S3_Host(new AWS_Credentials(AWS_Credentials.NoAutoLoad), DefaultTraceMode)

```
All key/value pairs defined for each set of credentials are preserved. You can add your own parameters:



[credentials1]</br>
aws\_access\_key\_id= …</br>
…</br>
age\_du\_capitaine = 32

And retrieve the value as follow:

```xojo

var s3_cred = new AWS_Credentials(“credentials1”)

var something as string = s3_cred.GetCustomParameter(“age_du_capitaine”)

var s3_host as new AWS_S3_Host( s3_cred , DefaultTraceMode)

```

## Notes
1. The library has only been tested against amazonaws.com.



## Constants in Window1

The window Window1 has the following constants:

DefaultBucket: name of the bucket used for tests

DefaultObjectName: name of the object(file) used to test the get function

DefaultTraceMode: boolean to enable/disable tracing of the requests







