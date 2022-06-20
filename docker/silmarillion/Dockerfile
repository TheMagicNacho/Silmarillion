FROM debian:latest

RUN apt update -y && apt upgrade -y

RUN mkdir -p /svr

WORKDIR /svr

COPY ../../bin /svr

EXPOSE 8000

CMD ["./silmarillion-server"]
