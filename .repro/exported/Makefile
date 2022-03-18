BINARY_SHORT_NAME=${REPRO_BINARY_SHORT_NAME}
LINUX_BINARY_NAME=${BINARY_SHORT_NAME}-${LINUX_BINARY_VERSION}-linux-x86-64-static
LINUX_BINARY=${REPRO_BINARIES_DIR}/${LINUX_BINARY_NAME}

FORCE_STATIC_LINKING=-ldflags '-extldflags "-static"' 
#GO_LINKER_FLAGS=${FORCE_STATIC_LINKING}
GO_LINKER_FLAGS=

clean:
	go clean -cache -x ./... || true

purge: clean
	rm -f ${REPRO_BINARIES_DIR}/*
	rm -f go.sum
	chmod -R +w ${GOPATH}
	rm -f ${GOPATH}/bin/*

depend:
	go mod tidy

build: depend
	go build ./...

# disable test result caching using: -count 1
# disable parallel execution of tests using: -p 1 
test: build
	go test ./... -count 1 -p 1

install: build
	go install ./...

package: link-to-binary

${LINUX_BINARY}: depend
	mkdir -p ${REPRO_BINARIES_DIR}
	cd ${REPRO_BINARIES_DIR}
	CGO_ENABLED=0 GOOS=linux go build -a ${GO_LINKER_FLAGS} -o ${LINUX_BINARY} ${REPRO_MNT}/cmd/...

binary_report: 
	create_binary_report.sh ${LINUX_BINARY} > ${LINUX_BINARY}.properties

link-to-binary: ${LINUX_BINARY} binary_report
	cd ${REPRO_EXPORTED_DIR}/binaries && 								\
	ln -sfn ${LINUX_BINARY_NAME} ${BINARY_SHORT_NAME}
