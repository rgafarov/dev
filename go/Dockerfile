FROM dev-base

ARG ARC

ENV PATH=${PATH}:/usr/local/go/bin:/root/go/bin

RUN curl -o 'go.linux.tar.gz' https://dl.google.com/go/go1.23.4.linux-${ARC}.tar.gz && \
    tar -C /usr/local -xzf go.linux.tar.gz && \
    rm -f go.linux.tar.gz && \
    go install golang.org/x/tools/gopls@latest && \
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.55.2

USER dev:dev
