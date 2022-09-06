FROM golang
RUN git clone https://github.com/raevem/itea.git
RUN apt install systemctl
RUN cd go run ~/itea/infrastructure/
RUN echo "go run ~/itea/application/server.go" > start.sh
RUN systemctl enanbe ~/itea/infrastructure/start.sh
EXPOSE 8081
