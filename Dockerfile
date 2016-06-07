# Pull base image.
FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y ca-certificates vim-tiny screen wget unzip

# Install ruby2.0, which is backwards compatible with ruby 1.9.3 
# (actually, it seems to just install 1.9.3)
# The libs are for installing nokogiri
RUN apt-get install -y git libxml2-dev libxslt-dev libsqlite3-dev ruby2.0 bundler

# Installs python 2.7.6 and packages necessary to install requirements.txt
#RUN apt-get install -y python python-dev python-pip git

# Set up our app files and install
RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN bundle install

# app
EXPOSE 80
VOLUME ["/usr/src/app"]
CMD rake db:migrate && rails server -p 80
