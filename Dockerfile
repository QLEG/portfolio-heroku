# 公式のイメージからRubyを取得
FROM ruby:2.6

#パッケージリストの更新とインストール
RUN apt-get update && apt-get install -y \ 
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client
  # yarn

  # 公式のインストール方法を参考に安定版で最新のyarnをインストールする
# https://qiita.com/TomoProg/items/9497be086d338b3b74cc
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

#RUNやADDなどの命令実行対象ディレクトリを指定
WORKDIR /portfolio
COPY Gemfile Gemfile.lock /portfolio/
RUN bundle install