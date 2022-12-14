
install_dependencies: install_lint

install_lint:
	go install golang.org/x/lint/golint@latest

install_staticcheck:
	go install honnef.co/go/tools/cmd/staticcheck@latest


validate: validate_lint validate_vet
# validate_staticcheck validate_dependencyVulnerability validate_licenseFile validate_licenseCheck

validate_lint:
	golint -set_exit_status ./...

validate_vet:
	go vet ./...

validate_staticcheck:
	staticcheck ./...

validate_dependencyVulnerability:

validate_licenseFile:

validate_licenseCheck:

build:
    go build -o ${BINARY_NAME} main.go
 
test:
    go test -v main.go
 
run:
    go build -o ${BINARY_NAME} main.go
    ./${BINARY_NAME}
 
clean:
    go clean
    rm ${BINARY_NAME}

all: validate build test