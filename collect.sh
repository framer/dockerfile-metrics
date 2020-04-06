#!/bin/bash
METRIC=$(curl -s http://localhost:${SERVICE_PORT}/metrics | grep ${METRIC_NAME})
 
aws cloudwatch put-metric-data --metric-name ${METRIC_NAME} --dimensions ClusterName=${CLUSTER_NAME} --dimensions TaskDefinitionFamily=${CONTAINER_NAME} --namespace "ECS/Custom" --value ${METRIC}
