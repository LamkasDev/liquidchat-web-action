FROM debian:stable-slim

LABEL "maintainer"="TheDoctor0 <dawid.janik95@gmail.com>"
LABEL "repository"="https://github.com/TheDoctor0/zip-release"
LABEL "version"="0.4.0"

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get install -y zip \
    && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_15.x | bash \
    && apt-get install -y nodejs \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g yarn \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
