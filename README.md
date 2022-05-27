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

# To View
```
docker ps
```

# View topics in kafka
* enter kafka container
```
docker exec -it kafka bash
```
* list topics
```
kafka-topics.sh --list --bootstrap-server kafka:9092
kafka-topics.sh --describe --bootstrap-server kafka:9092
```

* receive on topic
```
kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic omkafka --from-beginning
```

# Send syslog message to rsyslogd => kafka (via omkafka)
* enter rsyslog container
```
docker exec -it rsyslog bash
```

* simulate log message
```
logger 'hello from rsyslog'
```

# Shutdown
```
docker-compose down
```
