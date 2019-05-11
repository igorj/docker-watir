FROM ruby:2.6.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

COPY . .

CMD "bundle exec ruby ./test2.rb"