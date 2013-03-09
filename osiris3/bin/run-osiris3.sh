#!/bin/sh
# This will be the run directory
RUN_DIR=`pwd`

# Move up to the parent directory
cd ..
# This will the base directory
BASE_DIR=`pwd`

# This will be the services directory (osiris.home). You can changed the location anytime.
SERVICES_DIR=$BASE_DIR/services

# set the java home if neccessary
# JAVA_HOME=

# set java options
JAVA_OPTS="-Dosiris.run.dir=$RUN_DIR -Dosiris.base.dir=$BASE_DIR -Dosiris.services.dir=$SERVICES_DIR -Dosiris.home=file:///$SERVICES_DIR" 

JAVA_CLASSPATH=$(echo lib/*.jar | tr ' ' ':')
JAVA_CLASSPATH=$JAVA_CLASSPATH:$(echo server/osiris3/lib/*.jar | tr ' ' ':')

# run java
if [ "x$JAVA_HOME" = "x" ]; then
   JAVA="java"
else
   JAVA="$JAVA_HOME/bin/java"
fi

$JAVA $JAVA_OPTS -cp $JAVA_CLASSPATH com.rameses.osiris3.server.common.OsirisServerBootstrap

