FROM ubuntu:latest

RUN : \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git \
    curl \
    libfuse2 \
    build-essential \
		ca-certificates \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    liblzma-dev \
    tk-dev \
    unzip \
    tmux \
    fzf \
    ripgrep \
    shellcheck \
    jq \
		python3-dev \
		nodejs \
		npm \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& :

WORKDIR /code

RUN curl -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O \
  && tar -xzf nvim-linux64.tar.gz \
  && ln -sf nvim-linux64/bin/nvim /usr/bin/nvim

RUN git clone --depth 1 https://github.com/AstroNvim/AstroNvim /root/.config/nvim \
  && git clone --depth 1 https://github.com/Jobin-Nelson/astronvim_config.git /root/.config/lua/user

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"
