##!/bin/bash

rabbitmq_status=`salt-call service.status rabbitmq-server`
status=`echo $rabbitmq_status | cut -d \: -f 2`
if [ $status == True ]
then
salt-call service.stop rabbitmq-server
echo "RabbitMQ Server Instance is Stopped"
salt-call service.start rabbitmq-server
echo "RabbitMQ Server Instance is Started"
elif [ $status == False ]
then
echo "RabbitMQ Server Instance is Already Stopped"
salt-call service.start rabbitmq-server
echo "RabbitMQ Server Instance is Started"
fi
