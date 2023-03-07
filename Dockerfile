FROM ruby:3.0-alpine
RUN apk add --update --no-cache \
      bash \
      binutils-gold \
      build-base \
      mysql \
      mysql-client \
      mariadb \
      mariadb-connector-c \
      mariadb-dev \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \ 
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      #python \
      tzdata \
      yarn
WORKDIR /app
COPY Gemfile ./
#COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
#COPY package.json yarn.lock ./
RUN yarn install --check-files
COPY . ./
RUN mkdir /var/data/ 
RUN mkdir /var/data/db/
RUN chmod -R 777 /var/data/db/

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]