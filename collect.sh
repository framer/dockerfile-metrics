#!/bin/bash
METRIC=$(curl -s http://${CONTAINER_NAME}:${SERVICE_PORT}/metrics | grep ${METRIC_NAME} | awk {'print $2'})
 
aws cloudwatch put-metric-data --region ${AWS_REGION} --metric-name ${METRIC_NAME} --dimensions ClusterName=${CLUSTER_NAME},TaskDefinitionFamily=${CONTAINER_NAME} --namespace "ECS/Custom" --value ${METRIC}
