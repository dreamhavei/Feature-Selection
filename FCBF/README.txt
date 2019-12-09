************************************************************************
README FILE
	prepared by Ravi Bhimavarapu and Huan Liu on April 14, 2004 at ASU

Java implementation of FCBF


This software is provided free of charge to the research community as an 
academic software package with no commitment in terms of support or 
maintenance.

The algorithm FCBF and its detailed description can be found in ICML 2003 
"Feature Selection for High-Dimensional Data: A Fast Correlation-Based 
Filter Solution" by Lei Yu and Huan Liu. 

This readme file consists of five sections as follows:

Section 0 – Contents of the zip file.

Section A – Run FCBF with the package 

Section B – Format of the input

Section C – Use the classes in the package

Section D – Miscellaneous Information

Prepared and implemented by Ravi Sekhar Reddy Bhimavarapu for the data
mining and machine learning lab at ASU 4/14/04

Ravi can be reached at ravi.bhim@asu.edu. 

***********************************************************************

Section 0 TABLE OF CONTENTS

After inflating the zip file these are the files and directories you would find.
*	‘fcbf_1_0.jar’ package file.
*	‘doc’ directory which has the documentation.
*	‘test’ directory which the sample test data (‘happy’ and ‘lc’).
*	This README document.


Section A How TO RUN

1) 	Go the directory which has the jar file
2)	Inflate the ‘jar’ file: run `jar xvf fcbf_1_0.jar' at command line
3)	Run “java featureselector.fcbf.MainClass ‘stem’ <delta>”

NOTE: The ‘delta’ value is optional. If no value is specified, the default value for ‘delta’ 
is 0.

Two simple datasets "happy" and lung-cancer dataset "lc" are provided in the 
"test" directory. Command to run on data "lc" is
For windows, 	‘java featureselector.fcbf.MainClass test\lc 0.13’  ( delta is 0.13 here )
For unix/linux,	‘java featureselector.fcbf.MainClass test/lc 0.13’  ( delta is 0.13 here )


Section B DATA FORMATS

The input is specified in two files, one containing the data (with .data 
extension) and the other containing the metadata information( with .rc extension). 
Both files should have the same stem, e.g., happy.data and happy.rc and the stem here 
is ‘happy’.

The <stem>.data file
--------------------
The data file contains one instance on each line and the attribute values are comma 
separated. The class label is given at the end of each instance.
??????????????

The <stem>.rc file
------------------
As mentioned above, the rc file contains information about the metadata. The format 
is explained below using the "happy.rc" file as an example.

2,unhappy,happy. # Number of classes, class_label1,class_label2,....
3		 # Number of attributes.
age - twenties,fifties.  # Attribute 1 label - Attribute values....
height - short,tall.
coll - not_college,college.

Section C

Importing the classes from the package in order to use them in your implementation.

The classes are present in the package “featureselector.fcbf”, so for importing the classes 
you need to add the line in the import declarations

	import featureselector.fcbf.*;

The source files for the 5 classes in the package are also compressed in the ‘jar’ file. 

To get an idea of how the classes should be instantiated and called, please look at 
the source file MainClass.java . One could also use the MainClass class to 
run the FCBF on a specified data set (steps shown in Section A)

Section D

Documentation for the classes – The documentation for the classes can be found in the 
directory ‘doc’

