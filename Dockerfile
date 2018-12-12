FROM  docker:latest

ENV SBT_VERSION=1.2.7

RUN apk --update add --no-cache openjdk8 bash curl bc ca-certificates py-pip && \
  update-ca-certificates && \
  curl -fsL https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
  $(mv /usr/local/sbt-launcher-packaging-$SBT_VERSION /usr/local/sbt || true) && \
  ln -s /usr/local/sbt/bin/* /usr/local/bin/ && \
  pip install docker-compose && \
  sbt sbtVersion

