#!/bin/sh
# This will be the run directory
RUN_DIR=`pwd`

# Move up to the parent directory
cd ..

# This will the base directory
BASE_DIR=`pwd`

# set the java home if neccessary
# JAVA_HOME=

# set java options
JAVA_OPTS= 

JAVA_CLASSPATH=$(echo lib/*.jar | tr ' ' ':')
JAVA_CLASSPATH=$JAVA_CLASSPATH:$(echo server/websocket/lib/*.jar | tr ' ' ':')

# run java
if [ "x$JAVA_HOME" = "x" ]; then
   JAVA="java"
else
   JAVA="$JAVA_HOME/bin/java"
fi

$JAVA $JAVA_OPTS -cp $JAVA_CLASSPATH com.rameses.websocket.WebsocketServer

