
depend:
	go mod tidy

build: depend
	go build ./...

clean:
	go clean -cache -x ./... || true

# disable test result caching using: -count 1
# disable parallel execution of tests using: -p 1 
test: build
	go test ./... -count 1 -p 1

install: build
	go install ./...

commands:
	go-dev.build-commands

purge: clean
	rm -f ${REPRO_BINARIES_DIR}/*
	rm -f go.sum
	chmod -R +w ${GOPATH}
	rm -f ${GOPATH}/bin/*
	rm -rf ${GOPATH}/pkg
