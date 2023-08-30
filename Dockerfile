FROM golang:1.21.0-alpine3.18 AS builder
WORKDIR /go/src/app
ENV GOOS=linux
ENV GOARCH=amd64
COPY . . 
RUN go build -o sleep

FROM scratch
COPY --from=builder /go/src/app/sleep /sleep
ENTRYPOINT [ "/sleep" ]