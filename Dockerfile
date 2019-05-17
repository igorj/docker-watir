FROM ubuntu:16.04

#install package dependencies
RUN apt-get update && apt-get install -y build-essential curl sudo wget git autoconf lsb-release


# install chrome
RUN apt-get install -y fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libnspr4 libnss3 libxss1 xdg-utils
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb


# install firefox
RUN apt-get install -y firefox language-pack-de-base


# install ruby with ruby-build
ENV RUBY_DIR /ruby
ENV RUBY_VERSION 2.6.3
ENV RUBY_INSTALL $RUBY_DIR/$RUBY_VERSION

RUN apt-get install -y libssl-dev libreadline-dev zlib1g-dev
RUN cd /usr/src && \
    git clone https://github.com/sstephenson/ruby-build.git && \
    ./ruby-build/install.sh && \
    mkdir -p $RUBY_INSTALL && \
    /usr/local/bin/ruby-build $RUBY_VERSION $RUBY_INSTALL && \
    rm -rf /usr/src/ruby-build


# set PATH
ENV PATH $RUBY_INSTALL/bin:$PATH

# update rubygems and install bundler
RUN gem update --system
RUN gem install bundler --force

# set working directory
WORKDIR /webtests

# bundle install
COPY Gemfile Gemfile.lock /webtests/
RUN bundle install --binstubs

COPY . /webtests

