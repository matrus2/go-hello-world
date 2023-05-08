FROM golang:1.20-alpine

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY src/main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /hello-world

EXPOSE 8888

CMD [ "/hello-world" ]