#! /usr/bin/env bash

#export HADOOP_ROOT_LOGGER="INFO,NullAppender"
#export HADOOP_OPTS="$HADOOP_OPTS -XX:-PrintWarnings -Djava.net.preferIPv4Stack=true"
#export ACCUMULO_GENERAL_OPTS="-XX:-PrintWarnings -Djava.net.preferIPv4Stack=true"
#cd ${ACCUMULO_HOME}/bin
#./stop-all.sh

pkill -f master
pkill -f tserver
pkill -f DataNode
pkill -f NameNode
pkill -f zoo

#cd ${ZOOKEEPER_HOME}/bin
#./zkServer.sh stop > /tmp/zookeeper.out
#cd ${THISDIR}
