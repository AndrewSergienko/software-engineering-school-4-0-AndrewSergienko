FROM golang:latest as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go install github.com/pressly/goose/v3/cmd/goose@latest
RUN go mod download

COPY . .

RUN go build -o /goapp ./cmd
