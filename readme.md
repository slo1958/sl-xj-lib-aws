Xojo library to transfer files to and from a AWS S3 bucket


Test program implementing a basic navigator.

To run the program, you need to create a text file named xxx
With the following content:

[default]</br>
aws_access_key_id = (your access key)</br>
aws_secret_access_key = (your secret key)</br>
aws_region = (your region, for example eu-west-3)</br>

The test section uses fixed bucket name and file name. They are defined as constant in the definition of the WIndow1 object and must be updated.


The window Window1 has the following constants:

DefaultBucket: name of the bucket used for tests

DefaultObjectName: name of the object(file) used to test the get function

DefaultTraceMode: boolean to enable/disable tracing of the requests







