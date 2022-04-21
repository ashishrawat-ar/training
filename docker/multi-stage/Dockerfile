FROM golang As build1

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN go env -w GO111MODULE=auto
RUN go build -o main .

CMD ["/app/main"]





FROM alpine

WORKDIR /final


COPY --from=build1 /app .


CMD ["/final/main"]

