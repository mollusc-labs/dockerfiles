FROM perl:5.38.2-bullseye
RUN cpan App::cpanminus
WORKDIR /service
COPY lib ./lib

# Assumes entry point is app.pl
ARG APP="app.pl"
COPY templates ./templates
COPY ${APP} .

COPY cpanfile .
RUN cpanm --installdeps .
EXPOSE 3000
# Runs application with multiple threads
CMD ["perl", "$APP", "prefork", "-m", "production"]
