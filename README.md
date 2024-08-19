# Hadoop/Spark/Kafka Cluster on Docker

Quick setup for a cluster running Hadoop (with YARN), Spark, and Kafka. Not currently set up to have persistent storage. For testing and education.

With current setup, Zookeeper and Spark Driver run on the Namenode, and a kafka broker runs on each datanode (probably not the best setup but now I can test all 3!)

# Prerequisites

This was created on Docker in Windows 10, not tested on other platforms.

Initial configuration has 3 datanodes and no secondarynamenode. Disable datanodes by commenting them out in `docker-compose.yaml` for better performance or un-comment the secondary namenode.

Start by pulling the required image:

    docker pull apache/hadoop:3

## Setup

Create the custom images in the `docker` directory

    cd ./docker/datanode
    docker build --tag datanode .

    cd ../namenode
    docker build --tag namenode .

## Run

Now just cd back into the project directory and run the docker-compose file

    docker compose up -d

When you're done close everything in the Docker GUI and delete the volumes or run:

    docker-compose down -v

