FROM golang:alpine

ADD . /go/src/github.com/oliver006/redis_exporter
RUN cd /go/src/github.com/oliver006/redis_exporter && go get && go build

FROM gliderlabs/alpine
MAINTAINER Oliver <oliver@21zoo.com>

COPY --from=0 /go/bin/redis_exporter /bin/redis_exporter

EXPOSE     9121
ENTRYPOINT [ "/bin/redis_exporter" ]
