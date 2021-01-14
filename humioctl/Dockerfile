FROM golang:rc-alpine3.12
COPY *.sh /go/

RUN go install github.com/humio/cli/cmd/humioctl@latest && go clean -modcache && chmod +x /go/*.sh

CMD "/go/run.sh"
