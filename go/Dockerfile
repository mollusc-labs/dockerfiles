FROM golang:1.20.3-bullseye AS builder
WORKDIR /service
COPY . .
RUN CGO_ENABLED=0 go build -o service .

FROM ubuntu:latest
COPY --from=builder /service /service
WORKDIR /service
CMD ./service
