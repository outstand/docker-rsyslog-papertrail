# Supported tags and respective `Dockerfile` links

- [`latest`, (*Dockerfile*)](https://github.com/outstand/docker-rsyslog-papertrail/blob/master/Dockerfile)

# Usage

```yaml
syslog:
  image: outstand/rsyslog-papertrail:latest
  labels:
    io.rancher.os.scope: system
  log_driver: json-file
  net: host
  privileged: true
  restart: always
  uts: host
  volumes_from:
  - system-volumes
  environment:
    - LOG_DESTINATION=${log_destination}
```
