FROM alpine:3.19

RUN apk add --no-cache zola

COPY my_portfolio /my_portfolio

WORKDIR /my_portfolio

# expose the port
EXPOSE 8080

ENTRYPOINT ["zola", "serve", "-i", "0.0.0.0", "-p", "8080"]