FROM phusion/baseimage:0.9.9
MAINTAINER EdenServers

CMD ["/sbin/my_init"]

# Install base packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential git libxml2-dev libxslt1-dev nodejs software-properties-common python-software-properties

# Install Ruby 2.2.2
RUN apt-add-repository ppa:brightbox/ruby-ng && \
    apt-get update && \
    apt-get install -y ruby2.2 ruby-switch

RUN ruby-switch --set ruby2.2

# Clean apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Install API
RUN mkdir /usr/edenapi
RUN git clone https://github.com/EdenServers/EdenAPI.git /usr/edenapi

WORKDIR /usr/edenapi
RUN bundle install --without development test
