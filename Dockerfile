FROM ruby:3.3-bookworm

ARG BUNDLER_VERSION=4.0.4

ENV LANG=C.UTF-8 \
    BUNDLE_FROZEN=true

WORKDIR /site

RUN git config --system --add safe.directory /site

RUN gem install bundler --version "${BUNDLER_VERSION}"

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--destination", "/tmp/robosemi-site", "--force_polling"]
