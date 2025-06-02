# Base image
FROM ruby:3.4.4

# Add our Gemfile and install gems
ADD Gemfile* ./
ADD hanikamu-active_command.gemspec ./


WORKDIR "/app"
