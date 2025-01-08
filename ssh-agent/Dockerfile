FROM dev-base

ARG SOCKET_DIR=/.ssh-agent

RUN apt -y install openssh-server socat

# adding non root user(dev) and prepare dir for ssh socket
RUN mkdir -p ${SOCKET_DIR} && chown dev:dev ${SOCKET_DIR}

USER dev:dev

COPY --chown=dev:dev entry.sh /entry.sh

ENV SOCKET_DIR=${SOCKET_DIR}
ENV SSH_AUTH_SOCK ${SOCKET_DIR}/ssh_auth_sock
ENV SSH_AUTH_PROXY_SOCK ${SOCKET_DIR}/ssh_auth_proxy_sock

ENTRYPOINT ["/entry.sh"]

CMD ["ssh-agent"]
