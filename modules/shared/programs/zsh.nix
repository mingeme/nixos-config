{ pkgs, ... }:
{
  enable = true;
  autocd = true;
  enableCompletion = true;

  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "httpie"
    ];
    theme = "gallois";
  };

  plugins = [
    {
      name = "zsh-fuckmit";
      src = pkgs.fetchFromGitHub {
        owner = "mingeme";
        repo = "zsh-fuckmit";
        rev = "2cde93ffc824af305fd8cbc12fa0145d8ebe784b";
        sha256 = "sha256-vkF5EdBSBosXlwawgenQ1qHkAO8dCTc07IYMoaXiq60=";
      };
    }
  ];

  autosuggestion = {
    enable = true;
  };

  shellAliases = {
    lg = "lazygit";
    vi = "nvim";
    vim = "nvim";
    ls = "eza";
    cat = "bat --paging=never";
    ps = "procs";
    lv = "lazyv2ex";
  };

  initExtraFirst = ''
    if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
      . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
    fi

    # Define variables for directories
    export PATH=$HOME/.pnpm-packages/bin:$HOME/.pnpm-packages:$PATH
    export PATH=$HOME/.npm-packages/bin:$HOME/bin:$PATH
    export PATH=$HOME/.local/share/bin:$PATH

    # Remove history data we don't want to see
    export HISTIGNORE="pwd:ls:cd"

    # My editor
    export ALTERNATE_EDITOR=""
    export EDITOR="nvim"
    export VISUAL="nvim"

    # nix shortcuts
    shell() {
        nix-shell '<nixpkgs>' -A "$1"
    }

    # Use difftastic, syntax-aware diffing
    alias diff=difft
  '';
}
