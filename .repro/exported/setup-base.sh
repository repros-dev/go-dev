sudo apt -y install gcc

GO_VERSION=1.16
GO_DOWNLOADS_URL=https://dl.google.com/go
GO_ARCHIVE=go${GO_VERSION}.linux-amd64.tar.gz

sudo wget ${GO_DOWNLOADS_URL}/${GO_ARCHIVE} -O /tmp/${GO_ARCHIVE}
sudo tar -xzf /tmp/${GO_ARCHIVE} -C /usr/local

repro.setenv GOPATH '$(repro.state_dir_for_module go-dev)'
repro.setenv REPRO_BINARIES_DIR '${REPRO_EXPORTED_DIR}/binaries'
repro.setenv LINUX_BINARY_VERSION 0.2.6

repro.prefixpath /usr/local/go/bin
repro.prefixpath '${GOPATH}/bin'
repro.prefixpath '${REPRO_MNT}/.repro/exported/binaries'

repro.setenv GO_DEV_MAKEFILE '$(repro.installation_dir_for_module go-dev)'/Makefile
