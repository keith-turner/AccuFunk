#! /usr/bin/env bash

THISDIR=`pwd`

export HADOOP_ROOT_LOGGER="INFO,NullAppender"
export HADOOP_OPTS="$HADOOP_OPTS -XX:-PrintWarnings -Djava.net.preferIPv4Stack=true"
export ACCUMULO_GENERAL_OPTS="-XX:-PrintWarnings -Djava.net.preferIPv4Stack=true"

rm -rf ${ZOOKEEPER_HOME}/data/*
rm -rf ${integration.hadoop.dir}/dfs/*

cd ${ZOOKEEPER_HOME}/bin
chmod u+x *
./zkServer.sh start > /tmp/zookeeper.out

cd ${HADOOP_HOME}/bin
chmod u+x *
./hdfs namenode -format -clusterid "CID-raccovery-functional-testing"
./hdfs namenode &
./hdfs datanode &

sleep 20
SAFEMODE=`./hdfs dfsadmin -safemode get | awk '{ print $NF }'`
while [[ $SAFEMODE != "OFF" ]]; do
  sleep 1
  SAFEMODE=`./hdfs dfsadmin -safemode get | awk '{ print $NF }'`
done

cd ${ACCUMULO_HOME}/bin
chmod u+x *
./accumulo init --instance-name raccovery --password raccovery
echo "Starting tserver"
./accumulo tserver --address localhost &
echo "Starting master"
./accumulo master --address localhost &
echo "Accumulo started"

cd ${THISDIR}
