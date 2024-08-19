#!/bin/bash

hdfs secondarynamenode &
HDFS_PID=$!

sudo /opt/kafka/kafka_2.13-3.8.0/bin/zookeeper-server-start.sh /opt/kafka/kafka_2.13-3.8.0/config/zookeeper.properties
ZOO_PID=$!

wait $HDFS_PID
wait $ZOO_PID