FROM golang:1.12.9-alpine3.10

WORKDIR /go/src/server/
RUN apk add --no-cache gcc musl-dev ca-certificates git bash curl

COPY . ./
