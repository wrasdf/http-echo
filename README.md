## The Simple HTTP ECHO SERVER

#### How To Use it

  `docker run --rm -d -e SERVER_PORT=8080 -e SERVER_ECHO="It works as I expected" ikerry/http-echo:latest`


#### E2E test
  `make go && make test`
