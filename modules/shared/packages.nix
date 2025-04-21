{ pkgs }:

with pkgs; [
  # General packages for development and system management
  aspell
  aspellDicts.en
  bash-completion
  eza
  yazi
  bat
  procs
  curlie
  httpie
  lazygit
  btop
  killall
  neofetch
  openssh
  sqlite
  wget
  zip
  zoxide
  bun
  alejandra

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
  zsh-autosuggestions
  nix-zsh-completions
  fuckmit

  # Python packages
  python3
  virtualenv
]
