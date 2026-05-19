# syntax=docker/dockerfile:1
# check=error=true

# Development image for AutoGallery.
# Build it with Docker Compose and keep the source code mounted as a volume.
ARG RUBY_VERSION=3.3.6
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential curl default-mysql-client default-libmysqlclient-dev git libjemalloc2 libvips pkg-config && \
    ln -s /usr/lib/$(uname -m)-linux-gnu/libjemalloc.so.2 /usr/local/lib/libjemalloc.so.2 && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="" \
    LD_PRELOAD="/usr/local/lib/libjemalloc.so.2"

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN chmod +x bin/* && \
    sed -i 's/\r$//g' bin/*

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
