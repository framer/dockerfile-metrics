FROM ubuntu:18.04

COPY collect.sh /
COPY crontab /etc/cron.d/collect-cron
COPY docker-entrypoint.sh /
RUN chmod 0644 /etc/cron.d/collect-cron

RUN apt-get update \
  && apt-get -y install curl=7.58.0-2ubuntu3.8 cron=3.0pl1-128.1ubuntu1 awscli=1.14.44-1ubuntu1 --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "docker-entrypoint.sh" ]
