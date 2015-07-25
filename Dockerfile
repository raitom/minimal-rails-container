FROM alpine:3.2
MAINTAINER EdenServers

# Install base packages
RUN apk update && \
    apk upgrade && \
    apk add wget bash git ruby-dev build-base nodejs

# Install ruby and ruby-bundler
RUN apk add ruby ruby-io-console ruby-bundler

# Install API
RUN mkdir /usr/edenapi
RUN git clone https://github.com/EdenServers/EdenAPI.git /usr/edenapi

# nokogiri requirements
RUN apk add libxml2-dev libxslt-dev
RUN gem install nokogiri --no-rdoc --no-ri -- --use-system-libraries

# sqlite3 requirements
RUN apk add sqlite-dev
RUN gem install --no-rdoc --no-ri sqlite3

# Clean APK cache
RUN rm -rf /var/cache/apk/*

WORKDIR /usr/edenapi
RUN bundle install --without development test

# Add Start script
ADD start.sh /start.sh
RUN chmod 755 /start.sh

# Configure Rails project for production
ENV SECRET_KEY_BASE 628e6a76cce9d544a5d4c9e93beb067c0864fab1daa4dacf2eeff9bab723a0b5
EXPOSE 4000

CMD ["/start.sh"]
