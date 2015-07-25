FROM alpine:3.2
MAINTAINER EdenServers

# Install base packages
RUN apk update && \
    apk upgrade && \
    apk add wget bash git ruby-dev build-base nodejs

# Install ruby and ruby-bundler
RUN apk add ruby ruby-io-console ruby-bundler

#nokogiri requirements
RUN apk add ruby-nokogiri

# Clean APK cache
RUN rm -rf /var/cache/apk/*

#Install API
RUN mkdir /usr/edenapi
RUN git clone https://github.com/EdenServers/EdenAPI.git /usr/edenapi

WORKDIR /usr/edenapi
RUN gem install nokogiri
RUN bundle install --without development test
