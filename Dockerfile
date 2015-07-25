FROM alpine:3.2
MAINTAINER EdenServers

RUN apk update 
RUN apk upgrade
RUN apk add curl wget bash
