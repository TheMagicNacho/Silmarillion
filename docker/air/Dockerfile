FROM golang:1.17-alpine

RUN wget https://raw.githubusercontent.com/cosmtrek/air/master/install.sh -O - | sh -s -- -b $(go env GOPATH)/bin

RUN apk add --no-cache git

RUN touch ~/.netrc

ENTRYPOINT cd /code && go mod tidy && cd server && air -c ../docker/air/air.toml
