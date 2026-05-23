.PHONY: compose-setup compose-test compose-up dev

compose-setup:
	docker-compose run --rm app make setup

compose-test:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

compose-up:
	docker-compose up

dev:
	make compose-up
