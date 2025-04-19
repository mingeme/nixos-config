{ pkgs }:

with pkgs; [
  # General packages for development and system management
  alacritty
  aspell
  aspellDicts.en
  bash-completion
  eza
  yazi
  bat
  procs
  autojump
  curlie
  httpie
  fzf
  lazygit
  btop
  coreutils
  killall
  neofetch
  openssh
  sqlite
  wget
  zip
  zoxide
  bun
  neovim

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2

  # Cloud-related tools and SDKs
  docker
  docker-compose

  # Media-related packages
  dejavu_fonts
  ffmpeg
  font-awesome
  hack-font
  noto-fonts
  noto-fonts-emoji
  meslo-lgs-nf
  asciinema

  # Text and terminal utilities
  fd
  dua
  htop
  hunspell
  iftop
  jetbrains-mono
  jq
  ripgrep
  tree
  tmux
  unrar
  unzip
  p7zip
  zsh-powerlevel10k
  zsh-completions
  http-prompt
  httpie

  # Python packages
  python3
  virtualenv
]
