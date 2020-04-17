FROM ruby:2.7.0-alpine

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES 1

RUN apk update \
    && apk add tzdata \
    && apk add postgresql-client \
    && apk add postgresql-dev \
    && apk add make \
    && apk add libxml2-dev libxslt-dev \
    && apk add libc-dev gcc \
    && apk add --no-cache imagemagick

RUN bundle install

RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN echo "America/Sao_Paulo" >  /etc/timezone

COPY . .

# Expose is NOT supported by Heroku
EXPOSE 3000

# Run the image as a non-root user
RUN adduser -D docker-user
USER docker-user

# Managing warnings emitted by Ruby 2.7
# Ruby 2.7 comes with lot of experimental features such as pattern matching
# Most of the gems are being updated to fix the deprecations from Ruby 2.7
ENV RUBYOPT '-W:no-deprecated -W:no-experimental'

ENV RAILS_ENV 'production'

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
CMD bundle exec rails server -b 0.0.0.0 -p $PORT
