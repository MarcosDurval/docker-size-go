FROM golang:1.24 AS build
WORKDIR /src
COPY . .

RUN go build app.go

FROM scratch
COPY --from=build /src/app /bin/app
CMD ["/bin/app"]