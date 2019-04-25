
From golang as builder

WORKDIR /go/src/github.com/yhmin84/greet

COPY main.go .
RUN GOOS=linux go build -a -o greet .

FROM busybox

WORKDIR /opt/greet/bin


COPY --from=builder /go/src/github.com/yhmin84/greet/ .
ENTRYPOINT ["./greet"]
