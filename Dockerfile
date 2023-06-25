FROM jekyll/builder:4.0.0
WORKDIR /usr/app
COPY . .
RUN bundle install