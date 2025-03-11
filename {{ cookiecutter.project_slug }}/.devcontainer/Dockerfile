FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

RUN apt update && apt install -y \
  curl \
  wget \
  git \
  ripgrep \
  fzf \
  tmux \
  && rm -rf /var/lib/apt/lists/*

