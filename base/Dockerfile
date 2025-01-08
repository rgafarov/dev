FROM ubuntu:22.04

ARG UID
ARG GID

# locale
RUN apt update && apt -y install locales && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# common tools
RUN apt install -y automake cmake curl g++ gettext git libtool-bin make pkg-config unzip tmux

# non root user
RUN groupadd -f --gid ${GID} dev && useradd --uid ${UID} --gid dev --shell /bin/bash --create-home dev

USER dev:dev
WORKDIR /project

USER root:root

# # nvim and tmux settings
# RUN git clone https://github.com/rgafarov/dotfiles.git && \
#     mkdir -p ~/.config && cp -r ./dotfiles/nvim ~/.config/ && cp ./dotfiles/tmux/.tmux.conf ~/ && \
#     rm -rf dotfiles && \
#     git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim && \
#     vim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# 
# USER root:root
