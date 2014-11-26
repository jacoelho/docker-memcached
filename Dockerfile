FROM debian:wheezy
MAINTAINER Jose Coelho <jose.coelho@linkedcare.com>

ENV MEMCACHED_VERSION 1.4.13-0.2+deb7u1
ENV MEMCACHED_MEMORY 64

ADD run.sh /run.sh

RUN export DEBIAN_FRONT=noninteractive \
  && export LC_ALL=C \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    procps \
    memcached=${MEMCACHED_VERSION} \
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && chmod 755 /*.sh

EXPOSE 11211

CMD ["/run.sh"]
