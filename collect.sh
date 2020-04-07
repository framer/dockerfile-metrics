#!/bin/bash
METRIC=$(curl -s ${METRICS_ENDPOINT} | grep -v "#" | grep ${METRIC_NAME} | awk {'print $2'})
 
aws cloudwatch put-metric-data --region ${METRIC_AWS_REGION} --metric-name ${METRIC_NAME} --dimensions ClusterName=${METRIC_CLUSTER_NAME},TaskDefinitionFamily=${METRIC_CONTAINER_NAME} --namespace "ECS/Custom" --value ${METRIC}
