FROM ruby:2.3-alpine

WORKDIR /tmp
COPY Gemfile* /tmp/

RUN apk --no-cache add nodejs postgresql-dev sqlite-dev libxslt-dev tzdata \
 && apk --no-cache add --virtual build-dependencies build-base libxml2-dev ruby-dev libc-dev linux-headers openssl-dev mysql-dev \
 && bundle config build.nokogiri --use-system-libraries \
 && bundle install \
 && apk del build-dependencies

RUN mkdir /app
WORKDIR /app
COPY . /app

ENV RAILS_ENV=development

# This was added in a recent version, URL is unknown at this time.
ENV BOOL_API_URL=http://localhost:5000

EXPOSE 5000
CMD ["bin/docker_entrypoint.sh"]

