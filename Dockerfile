FROM debian:wheezy
MAINTAINER Jose Coelho <jose.coelho@linkedcare.com>

ENV MEMCACHED_VERSION 1.4.13-0.2+deb7u1
ENV MEMCACHED_MEMORY 64

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    procps \
    memcached=${MEMCACHED_VERSION} \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/ \
  && rm -rf /tmp/* /var/tmp/*

ADD run.sh /run.sh

RUN chmod 755 /*.sh

EXPOSE 11211

CMD ["/run.sh"]
