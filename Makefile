BINARY = hostname
IMAGE_REGISTRY = harbor.beautytiger.home
IMAGE_REPO = myapplication/hostname
IMAGE_TAG = latest

.PHONY: vendor

vendor:
	go mod tidy && go mod vendor
build:
	go build -o $(BINARY) main.go
image:
	docker build -t $(IMAGE_REGISTRY)/$(IMAGE_REPO):$(IMAGE_TAG) .
release: image
	docker push $(IMAGE_REGISTRY)/$(IMAGE_REPO):$(IMAGE_TAG)
