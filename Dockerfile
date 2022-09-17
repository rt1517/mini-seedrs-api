FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /mini-seedrs-api
COPY Gemfile /mini-seedrs-api/Gemfile
COPY Gemfile.lock /mini-seedrs-api/Gemfile.lock
RUN bundle install
COPY . /mini-seedrs-api
