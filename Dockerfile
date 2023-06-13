FROM ubuntu:latest

RUN : \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		build-essential \
		ca-certificates \
		curl \
		python3-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& :

WORKDIR /code

RUN curl -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O \
  && tar -xzf nvim-linux64.tar.gz \
  && mv nvim-linux64/bin/nvim /usr/bin 

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"
