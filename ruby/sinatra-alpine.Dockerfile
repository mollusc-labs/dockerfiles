FROM ruby:alpine

# Assuming a volume of .:/app
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

EXPOSE 4567
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
