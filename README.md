# Docker iperf tool
Docker container Iperf tool for network performance tests.
The iperf tool version used on the image is 2.0.13 (21 Jan 2019)

This iperf tool image can be found at:
* [Docker Hub](https://hub.docker.com/repository/docker/lroktu/iperf)

# Usage

## Image Pull

```
docker pull lroktu/iperf:latest
```

## Running the Image

```
docker run -d --name YOUR_CONTAINER_NAME lroktu/iperf YOUR_IPERF_ARGUMENTS
```

# Basic Docker Run Examples

## Iperf server

```
docker run -d --name iperf -p 5001:5001/udp lroktu/iperf -s -u -i 5
```

This command will start iperf in server mode(**-s**) to listen for udp connections(**-u**) and make bandwitdh traffic report every 5 seconds(**-i 5**). 
The server will listen for connections comming on any interface existing inside the container.
By default, iperf uses the port 5001, so we just need expose this port to external access.

## Iperf client

On another host, run the command below

```
iperf -c CONTAINER_HOST_IP -u 
```

This command will start iperf in client mode(**-c**) to connect in the specific host ip. The **-u** represents that just udp packets will be sent.
Or, another way, you can execute the same container image, but this time, passing client parameters, like below.

```
docker run --rm --name iperf-client lroktu/iperf -c CONTAINER_SERVER_HOST_IP -u
```

Where CONTAINER_SERVER_HOST_IP is the ip address of the host running the iperf server

## Checking Logs

To verify if everthing went ok, check the iperf server generated logs using the command below.

```
docker logs iperf
```

Where *iperf* is the image name given to the iperf server

# Iperf References

For more information about iperf tool, check the link below.
* [iperf](https://iperf.fr/iperf-doc.php)
