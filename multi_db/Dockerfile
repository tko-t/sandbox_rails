FROM ruby:3.1-slim

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

ARG APP_NAME
ARG WORKDIR
ARG USER
ARG USER_ID
ARG GROUP
ARG GROUP_ID

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    default-libmysqlclient-dev \
    default-mysql-client \
    fontconfig \
    git \
    graphviz \
    jq \
    less \
    openssl \
    tzdata \
    unzip \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone

WORKDIR $WORKDIR

# railsだけ。rails new で上書き
ADD ./ $WORKDIR
#ADD ./Gemfile* $WORKDIR
#ADD ./Gemfile.lock $WORKDIR/Gemfile.lock

# ローカル環境のIDと合わせたらいいと思う
RUN groupadd --gid $GROUP_ID --system $USER \
    && useradd --uid $USER_ID --gid $GROUP_ID --system --create-home $USER \
    && chown -R $USER:$GROUP $WORKDIR

RUN chown $USER:$GROUP $WORKDIR/*

USER $USER

RUN bundle install

# docker-composeで使うからCMDなし
