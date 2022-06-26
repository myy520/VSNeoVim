FROM ubuntu:latest

RUN apt update && apt list --upgradable && \
  apt -y install curl sudo git cargo python3-dev python3-pip ripgrep neovim 

ENV PATH="/root/.local/bin:/root/.cargo/bin:/root/.npm-global/bin${PATH}"

RUN git clone --branch main https://github.com/VSNeoVim/VSNeoVim.git

RUN mkdir -p /root/.local/share

RUN mv VSNeoVim /root/.local/share/vsneovim

RUN mkdir -p /root/.local/bin

WORKDIR /root/.local/share/vsneovim

COPY utils/bin/vsn.template /root/.local/bin/vsn

RUN chmod +x /root/.local/bin/vsn

CMD ["/root/.local/bin/vsn"]
