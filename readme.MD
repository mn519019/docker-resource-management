## Container Resource Management
- Docker command can control hardware resource such as  "cpu", "memory", and "disk I/O"

```
# Memory
docker run -d -m 512m nginx:1.14
docker run -d -m 1g --memory-reservation 500m nginx:1.14
docker run -d m 200m --memory-swap 300m nginx:1.14 -> another 100mb can be borrowed from disk
docker run -d -m 200m --oom-kill-disable nginx:1.14
```

```
# CPU
docker run -d --cpus="5" ubuntu:1.14
docker run -d --cpu-shares 2048 ubuntu:1.14
docker run -d --cpuset-cpus 0-3 ubuntu:1.14

```

```
# Resource Monitoring
docker stats [options] [container]
docker events -f container=name
docker image -f container=anme

```