#!/bin/sh
printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export METRIC" > /metrics_envs.sh
cron && tail -f /var/log/cron.log
