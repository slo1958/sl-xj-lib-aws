# sl-xj-lib-aws
Xojo library to transfer files to and from a AWS S3 bucket

The library is provided as is for free and it is available in a github repo. Please give credit to the author when applicable. 
In the unlikely case someone finds a bug ;), please use github to report the issue.


## Test/demo

Test program implementing a basic navigator.

To run the program, you need to create a text file named xxx
With the following content:

[default]</br>
aws\_access\_key\_id = (your access key)</br>
aws\_secret\_access\_key = (your secret key)</br>
aws\_region = (your region, for example eu-west-3)</br>

The test section uses fixed bucket name and file name. They are defined as constant in the definition of the WIndow1 object and must be updated.

## Constants in Window1

The window Window1 has the following constants:

DefaultBucket: name of the bucket used for tests

DefaultObjectName: name of the object(file) used to test the get function

DefaultTraceMode: boolean to enable/disable tracing of the requests







