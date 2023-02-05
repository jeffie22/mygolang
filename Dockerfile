FROM golang:1.13-alpine AS build

WORKDIR $GOPATH/src/golang/

COPY . .

RUN go build -ldflags "-s -w" -o /go/bin/golang

FROM scratch

COPY --from=build /go/bin/golang /go/bin/golang

ENTRYPOINT ["/go/bin/golang"]
