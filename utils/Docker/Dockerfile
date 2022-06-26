FROM ubuntu:latest

RUN apt update && apt list --upgradable && \
  apt -y install curl sudo git cargo python3-dev python3-pip ripgrep lua5.1 && \
  apt -y install ninja-build gettext libtool libtool-bin autoconf make automake cmake g++ pkg-config unzip curl doxygen npm

RUN mkdir ~/.npm-global

RUN npm config set prefix '~/.npm-global'

RUN git clone https://github.com/neovim/neovim

WORKDIR neovim

RUN sudo make install

ENV PATH="/root/.local/bin:/root/.cargo/bin:/root/.npm-global/bin${PATH}"

RUN mkdir -p /root/.local/share

RUN git clone --branch main https://github.com/VSNeoVim/VSNeoVim.git /root/.local/share/vsneovim

WORKDIR /root/.local/share/vsneovim

RUN mkdir -p /root/.local/bin

RUN curl -s https://raw.githubusercontent.com/vsneovim/vsneovim/main/utils/bin/vsn.template >> /root/.local/bin/vsn

RUN mkdir -p /root/.config/vsn

RUN curl -s https://raw.githubusercontent.com/vsneovim/vsneovim/main/lua/vsn/dconf/defaultConfig.lua >> /root/.config/vsn/config.lua

RUN chmod +x /root/.local/bin/vsn

ENTRYPOINT ["/bin/bash"]

CMD ["vsn"]
