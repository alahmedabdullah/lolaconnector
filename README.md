LOLA Smart Connector for Chiminey
==================================
LOLA allows formal model checking of a system modeled as networks of timed automata. 

Verifying a complex lola model may become compute-intensive - thus make it a suitable candidate for parallel execution utilising compute resources over the cloud using Chiminey. "Lola Smart Connector for Chiminey" allows parameter sweep i.e. internal sweep and external sweep over lola  models which facilitates scheduling computes over the cloud for parallel execution.

Once "Lola Smart Connector" is activated in Chiminey, Chiminey portal then allows to configure and submit a LOLA job for execution.

LOLA Smart Connector Core Function
-----------------------------------
A payload (http://chiminey.readthedocs.io/en/latest/payload.html#payload) provides the core functionality of LOLA SC. The payload structure of LOLA SC is as following:

```
payload_lola/
|--- bootstrap.sh
|--- process_payload
|    |---main.sh
|    |---run.sh
```
The LOLA SC needs to install Lola binary. During activation of LOLA SC, the user is required to download appropriate version of lola, build the the 'lola' binary, create compresses tar.gz package for the lola binary  and place the tar.gz package in the 'package' directory.

"bootstrap.exe" installs all dependencies required to prepeare the Lola jobs execution environment. The "bootstrap.sh" installs LOLA. Please note that both LOLA is installed in "/opt" directory. Following is the content of "bootstrap.sh" for LOLA SC:    

```
#!/bin/sh
# version 2.0


WORK_DIR=`pwd`

yum -y update

ext="tar.gz"

LOLA_PACKAGE_NAME=$(sed 's/LOLA_PACKAGE_NAME=//' $WORK_DIR/package_metadata.txt)  
mv $WORK_DIR/$LOLA_PACKAGE_NAME /opt
cd /opt
tar xzvf $LOLA_PACKAGE_NAME

cd $WORK_DIR
```

The "main.sh" is a simple script that executes a shell script "run.sh" which copied in the "INPUT_DIR". It also passes on commmand line arguments i.e. INPUT_DIR and OUTPUT_DIR to "run.sh". Recall that Chiminey sends the path to input (INPUT_DIR) and output (OUTPUT_DIR) directories via command-line arguments<payload>. Here, the SC developer passes on INPUT_DIR, where LOLA model file is available.

Configure, Create and Execute a Lola Job
------------------------------------------
"Create Job" tab in "Chiminey Portal" lists "lola" form for creation and submission of lola job. "lola" form require definition of "Compute Resource Name" and "Storage Location". Appropiate "Compute Resource" and "Storage Resource" need to be defined  through "Settings" tab in the "Chiminey portal".

Parameter sweep for "LOLA Smart Connector" in Chiminey System may be performed by specifying appropiate JSON dictionary in "Internal sweep map" field. An example JSON dictionary to run internal sweep for the "planner.lola" and  "planner_boundedness.formula" could be as following:

```
{ "cli_parameters" :  [ "planner.lola --formula=planner_boundedness.formula"] }
``` 
Above would create an individual process to execute the lola model in  single VM in the cloud. 
