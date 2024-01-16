FROM alpine:latest

ARG UID="1000"
ARG GID="1000"

RUN apk add --no-cache iperf && \
    mkdir -p /opt/iperf && \
    addgroup --g "${GID}" -S iperf && \
    adduser -h /opt/iperf -s /bin/sh -u "${UID}" -G iperf -S iperf && \
    cd /opt/iperf && \
    chown iperf:iperf -R /opt/iperf

EXPOSE 5201/udp
EXPOSE 5201/tcp

USER "iperf"
WORKDIR /opt/iperf

ENTRYPOINT [ "/usr/bin/iperf" ]
