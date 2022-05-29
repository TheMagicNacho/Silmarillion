server-dep:
	@cd server && go mod tidy

server-build: server-dep
	@cd server && go build -o ../bin/silmarillion-server

server-img: server-build
	@docker build -t silmarillion-server .

server-run: server-img
	@docker run -d -p 8000:8000 --rm silmarillion-server
