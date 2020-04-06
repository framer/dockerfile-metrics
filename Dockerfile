FROM ubuntu:18.04

COPY crontab /etc/cron.d/collect-cron
RUN chmod 0644 /etc/cron.d/collect-cron

RUN apt-get update \
  && apt-get -y install cron=3.0pl1-128.1ubuntu1 --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

CMD ["cron"]
