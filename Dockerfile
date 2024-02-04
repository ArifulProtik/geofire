

FROM golang:1.21

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod ./
RUN go mod download && go mod verify

COPY . .

# for Devlopment with hot reload
RUN go install github.com/cosmtrek/air@latest

CMD ["air"]
#
# for Production
# RUN go build -buildvcs=false -v -o /usr/local/bin/app ./api
#
# CMD ["app"]
