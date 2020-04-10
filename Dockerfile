FROM  docker:latest

ENV SBT_VERSION=1.2.7

RUN apk --update add --no-cache openjdk8 bash curl bc ca-certificates python-dev libffi-dev openssl-dev gcc libc-dev make py-pip git openssh && \
  update-ca-certificates && \
  curl -fsL https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
  ln -s /usr/local/sbt/bin/* /usr/local/bin/ && \
  pip install --upgrade pip && \
  pip install docker-compose && \
  sbt sbtVersion

