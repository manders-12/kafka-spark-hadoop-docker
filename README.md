# Hadoop/Spark/Kafka Cluster on Docker

Quick setup for a cluster running Hadoop (with YARN), Spark, and Kafka. Not currently set up to have persistent storage.

# Prerequisites

This was created on Docker in Windows 10, not tested on other platforms.

Start by pulling the required image:

    docker pull apache/hadoop

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

