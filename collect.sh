#!/bin/bash
METRIC=$(curl -s http://localhost:${SERVICE_PORT}/metrics | grep ${METRIC_NAME} | awk {'print $2'})
 
aws --region ${AWS_REGION} cloudwatch put-metric-data --metric-name ${METRIC_NAME} --dimensions ClusterName=${CLUSTER_NAME},TaskDefinitionFamily=${CONTAINER_NAME} --namespace "ECS/Custom" --value ${METRIC}
