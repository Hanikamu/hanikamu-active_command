# Base image
FROM ruby:3.2.2-slim

# Add our Gemfile and install gems
ADD Gemfile* ./
ADD hanikamu-active_command.gemspec ./


RUN bundle check || bundle install

WORKDIR "/app"
