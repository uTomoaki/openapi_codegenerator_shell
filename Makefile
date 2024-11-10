.PHONY: generate-backend-api generate-frontend-api generate-all

generate-backend-api:
	sh generator/generate-backend.sh

generate-frontend-api:
	sh generator/generate-frontend.sh

generate-all: generate-backend-api generate-frontend-api
