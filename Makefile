.PHONY: compose-setup compose-test compose-up dev ci

compose-setup:
	docker-compose run --rm app make setup

compose-test:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-up:
	docker-compose up

dev:
	make compose-up

# CI: run tests with docker-compose and cleanup after
ci:
	@echo "Running CI tests with docker-compose"
	@set -e; \
	 docker-compose -f docker-compose.yml build app; \
	 docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app; \
	 EXIT_CODE=$$?; \
	 docker-compose -f docker-compose.yml down --volumes --remove-orphans || true; \
	 exit $$EXIT_CODE
