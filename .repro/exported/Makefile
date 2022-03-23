
depend:
	go mod tidy

build: depend
	go build $(REPRO_MNT)/...

clean:
	go clean -cache -x $(REPRO_MNT)/... || true

# disable test result caching using: -count 1
# disable parallel execution of tests using: -p 1 
test: build
	go test $(REPRO_MNT)/... -count 1 -p 1

install: build
	go install $(REPRO_MNT)/...

commands: depend
	go-dev.build-commands

purge: clean
	rm -f ${REPRO_BINARIES_DIR}/*
	rm -f $(REPRO_MNT)/go.sum
	chmod -R +w ${GOPATH}
	rm -f ${GOPATH}/bin/*
	rm -rf ${GOPATH}/pkg/*
