.PHONY: build
build:
	go run app.go store.json
	go run app.go store-armhf.json
	go run app.go store-arm64.json
