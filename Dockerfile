FROM debian:jessie
MAINTAINER Bean Works <no-reply@beanworks.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  # Install gcc, g++, git, make, Ruby, and zlib.
  apt-get update && \
  apt-get install -yqq \
    gcc \
    g++ \
    git \
    make \
    ruby \
    ruby-dev \
    rubygems-integration \
    zlib1g-dev && \
  # Install Bundler.
  gem install bundle && \
  # Install fakes3.
  git clone https://github.com/beanworks/fake-s3.git && \
  cd fake-s3 && \
  bundle install && \
  # Create fakes3 filesystem directory.
  mkdir -p /fakes3_root

ENTRYPOINT ["/fake-s3/bin/fakes3"]
CMD ["-r",  "/fakes3_root", "-p",  "4569"]
EXPOSE 4569
