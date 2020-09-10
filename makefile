.PHONY: go sh e2e

go:
	./bin/run.sh

e2e:
	./bin/e2e.sh

sh:
	docker-compose build sh
	docker-compose run --rm sh
