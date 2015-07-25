FROM alpine:3.2
MAINTAINER EdenServers

# Install base packages
RUN apk update
RUN apk upgrade
RUN apk add wget bash git ruby-dev build-base

# Install ruby and ruby-bundler
RUN apk add ruby ruby-io-console ruby-bundler

# Clean APK cache
RUN rm -rf /var/cache/apk/*

#Install API
RUN mkdir /usr/edenapi
RUN git clone https://github.com/EdenServers/EdenAPI.git /usr/edenapi

WORKDIR /usr/edenapi
RUN bundle install --without development test
