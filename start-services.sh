#!/bin/bash

hdfs datanode &
HDFS_PID=$!

yarn nodemanager &
YARN_PID=$!


sudo sed -i 's|zookeeper.connect=localhost:2181|zookeeper.connect=namenode:2181|' /opt/kafka/kafka_2.13-3.8.0/config/server.properties
sudo /opt/kafka/kafka_2.13-3.8.0/bin/kafka-server-start.sh /opt/kafka/kafka_2.13-3.8.0/config/server.properties &
KAFKA_PID=$!

# Wait for both processes to finish
wait $HDFS_PID
wait $YARN_PID
wait $KAFKA_PID