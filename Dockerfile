FROM maven:3.3-jdk-8
MAINTAINER Toshiaki Maki <tmaki@pivotal.io>

ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
ADD https://deb.nodesource.com/setup_7.x /tmp/setup_7.x
RUN apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN bash /tmp/setup_7.x

RUN apt-get -y update && \
  apt-get install -y --no-install-recommends nodejs yarn && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  yarn global add create-react-app react-scripts
