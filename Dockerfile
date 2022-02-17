FROM harbor.beautytiger.home/docker.io/golang:1.17.5 as builder
WORKDIR /build
ADD . /build
RUN go build -mod vendor -o hostname main.go

FROM harbor.beautytiger.home/docker.io/ubuntu:20.04
WORKDIR /app
COPY --from=builder /build/hostname /app/hostname
ENV GIN_MODE release
ENV APP_ENV prd
ENTRYPOINT /app/hostname