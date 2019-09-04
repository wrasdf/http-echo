.PHONY: go sh

go:
	docker-compose build go
	docker-compose run --rm -d --service-ports go

e2e:
	./bin/e2e.sh

sh:
	docker-compose build sh
	docker-compose run --rm sh
