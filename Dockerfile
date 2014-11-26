FROM debian:wheezy
MAINTAINER Jose Coelho <jose.coelho@linkedcare.com>

ENV MEMCACHED_VERSION 1.4.13-0.2+deb7u1

RUN export DEBIAN_FRONT=noninteractive \
  && export LC_ALL=C \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    memcached=${MEMCACHED_VERSION} \
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 11211

CMD ["/usr/bin/memcached", "-u", "memcache", "-v"]
