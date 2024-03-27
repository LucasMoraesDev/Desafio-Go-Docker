# Estágio de construção
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main .

# Estágio de execução
FROM scratch
COPY --from=builder /app/main /app/main
CMD ["/app/main"]
