FROM ubuntu:18.04

# Get user id and group id from arguments.
ARG UID
ARG GID

# Timezone.
ENV TZ 'UTC'
ENV DEBIAN_FRONTEND=noninteractive
RUN echo $TZ > /etc/timezone && \
  apt-get update && apt-get install -y tzdata && \
  rm /etc/localtime && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y --no-install-recommends curl && \
  apt-get remove make && apt-get install make && \
  apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/*

RUN groupadd -r serveruser -g $GID && useradd -ms /bin/bash serveruser -u $UID -g $GID

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -  && apt-get update && apt-get install -y --no-install-recommends nodejs npm build-essential && \
  npm config set registry http://registry.npmjs.org/ && npm install -g npm && \
  apt-get update && apt-get install -y --no-install-recommends libtool bundler && npm install -g grunt-cli gulp-cli babel-cli

USER serveruser

WORKDIR /home/serveruser

CMD ["tail", "-f", "/dev/null"]