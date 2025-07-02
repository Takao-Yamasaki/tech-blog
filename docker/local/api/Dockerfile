# TODO: ホットリロードを入れてみる
# https://future-architect.github.io/articles/20240620a/

# NOTE: https://docs.docker.jp/compose/rails.html
FROM ruby:2.7.4

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

RUN mkdir /app

WORKDIR /app

COPY blog_api/Gemfile blog_api/Gemfile.lock /app/

RUN bundle install

COPY blog_api /app
