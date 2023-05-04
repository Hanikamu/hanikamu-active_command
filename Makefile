 
ifeq ($(NIX_TYPE),Linux)
	SED_OPTS = -i
endif

ifeq ($(NIX_TYPE),Darwin)
	SED_OPTS = -i ""
endif


.PHONY: shell
shell: ## access to the system console
	 docker-compose run --rm app bash


.PHONY: build
build: ## build the image
	sudo docker-compose build

.PHONY: console
console: ## build the image
		sudo docker-compose run --rm app bash -c "bin/console"

.PHONY: rspec
rspec: ## build the image
	sudo docker-compose run --rm app bash -c "bundle exec rspec"


.PHONY: cops
cops: ## build the image
	sudo docker-compose run --rm app sh -c "bundle exec rubocop -A"