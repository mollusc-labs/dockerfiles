FROM perl:5.38.2-bullseye AS build
RUN cpan -I App::cpanminus
RUN cpanm
WORKDIR /service
COPY lib ./lib
ARG APP="app.pl"
ARG SERVER="Starman"
COPY templates ./templates
COPY cpanfile .
RUN cpanm Plack "$SERVER"
RUN cpanm --installdeps .

FROM build
COPY ${APP} .
ENV PLACK_ENV="${PLACK_ENV}"
EXPOSE 3000
# Runs application with multiple threads
CMD ["plackup", "$APP", "-s", "$SERVER", ]
