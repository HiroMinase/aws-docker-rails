FROM ruby:3.1

RUN mkdir /aws-docker-rails
WORKDIR /aws-docker-rails
COPY Gemfile /aws-docker-rails/Gemfile
COPY Gemfile.lock /aws-docker-rails/Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /aws-docker-rails

RUN mkdir -p tmp/sockets