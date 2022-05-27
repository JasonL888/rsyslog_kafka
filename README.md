# Summary
Scratchpad for prototyping work on
* rsyslog with omkafka
* kafka/zookeeper

# Getting Started
## Prequisites
* OS with bash compatible shell
* Docker (eg. Docker for Desktop on MacOS)

## Start
To startup containers
```
docker-compose up -d
```

## To View
```
docker ps
```

## View topics in kafka
* enter kafka container
```
docker exec -it kafka bash
```
* list topics
```
kafka-topics.sh --list --bootstrap-server kafka:9092
kafka-topics.sh --describe --bootstrap-server kafka:9092
```
  * sample output
```
mac> docker exec -it kafka bash
I have no name!@733820feac2e:/$ kafka-topics.sh --list --bootstrap-server kafka:9092
omkafka
I have no name!@733820feac2e:/$ kafka-topics.sh --describe --bootstrap-server kafka:9092
Topic: omkafka	TopicId: FbtFISTSThCksq6hrWv-Sg	PartitionCount: 1	ReplicationFactor: 1	Configs: segment.bytes=1073741824
	Topic: omkafka	Partition: 0	Leader: 1001	Replicas: 1001	Isr: 1001
```

* receive on topic
```
kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic omkafka --from-beginning
```
  * sample output
```
I have no name!@733820feac2e:/$ kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic omkafka --from-beginning
2022-05-27T04:00:18.843256+00:00 09423de42b8f rsyslogd: environment variable TZ is not set, auto correcting this to TZ=/etc/localtime [v8.1901.0 try https://www.rsyslog.com/e/2442 ]
2022-05-27T04:00:18.843262+00:00 09423de42b8f rsyslogd:  [origin software="rsyslogd" swVersion="8.1901.0" x-pid="1" x-info="https://www.rsyslog.com"] start
2022-05-27T04:00:18.851197+00:00 09423de42b8f rsyslogd: Could not open output pipe '/dev/xconsole':: No such file or directory [v8.1901.0 try https://www.rsyslog.com/e/2039 ]
2022-05-27T04:00:18.851395+00:00 09423de42b8f rsyslogd: action 'action-17-builtin:ompipe' suspended (module 'builtin:ompipe'), retry 0. There should be messages before this one giving the reason for suspension. [v8.1901.0 try https://www.rsyslog.com/e/2007 ]
2022-05-27T04:00:18.851448+00:00 09423de42b8f rsyslogd: action 'action-17-builtin:ompipe' suspended (module 'builtin:ompipe'), next retry is Fri May 27 04:00:48 2022, retry nbr 0. There should be messages before this one giving the reason for suspension. [v8.1901.0 try https://www.rsyslog.com/e/2007 ]
2022-05-27T04:03:51.817032+00:00 09423de42b8f root: hello from rsyslog
```

## Send syslog message to rsyslogd => kafka (via omkafka)
* enter rsyslog container
```
docker exec -it rsyslog bash
```

* simulate log message
```
logger 'hello from rsyslog'
```

* view from kafka container (as above)

## Shutdown
```
docker-compose down
```

# Known Issues
* rsyslog could not open '/dev/xconsole'
* rsyslogd: omkakfa suspended due to kafka error (but message still sent ??)

# Acknowledgments
* Using bitnami containers
  * https://bitnami.com/stack/kafka/containers

* Using omkafka module for rsyslog
  * https://www.rsyslog.com/doc/master/configuration/modules/omkafka.html
