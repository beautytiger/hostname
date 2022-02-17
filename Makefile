vendor:
	go mod tidy && go mod vendor
build:
	go build -o hostname main.go