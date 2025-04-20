{ config, pkgs, lib, user, ... }:
{
  enable = false;
  autocd = true;
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ../config;
      file = "p10k.zsh";
    }
    {
      name = "zsh-autosuggestions";
      src = pkgs.zsh-autosuggestions;
      file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.zsh-syntax-highlighting;
      file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
    }

  ];

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

    # Always color ls and group directories
    alias ls='ls --color=auto'
  '';
}
