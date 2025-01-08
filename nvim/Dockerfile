FROM dev-base

RUN git clone https://github.com/neovim/neovim.git && cd neovim && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && make install && cd ../ && rm -rf neovim

# nvim settings(+extra tmux), for dev user and common for all langs
USER dev:dev
RUN git clone https://github.com/rgafarov/dotfiles.git && \
    mkdir -p ~/.config && cp -r ./dotfiles/nvim ~/.config/ && cp ./dotfiles/tmux/.tmux.conf ~/ && \
    rm -rf dotfiles && \
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim && \
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 2 > /dev/null
USER root:root
