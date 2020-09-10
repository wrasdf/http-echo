FROM golang:1.12.9-alpine3.10 AS base

WORKDIR /go/src/server/
RUN apk add --no-cache gcc musl-dev ca-certificates git bash curl

COPY . ./

RUN CGO_ENABLED=0 go build -o /http-echo main.go

FROM scratch AS release
COPY --from=base /http-echo /http-echo

ENTRYPOINT ["/http-echo"]
