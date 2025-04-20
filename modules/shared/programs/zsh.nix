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
    diff = "difft";
  };

  initExtraFirst = ''
    if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
      . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
    fi

    export PATH="/opt/homebrew/bin:$PATH"

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # Define variables for directories
    export PATH=$HOME/.pnpm-packages/bin:$HOME/.pnpm-packages:$PATH
    export PATH=$HOME/.npm-packages/bin:$HOME/bin:$PATH
    export PATH=$HOME/.local/share/bin:$PATH

    # My editor
    export ALTERNATE_EDITOR=""
    export EDITOR="nvim"
    export VISUAL="nvim"

    export PATH="/Users/xming/.codeium/windsurf/bin:$PATH"

    # pnpm
    export PNPM_HOME="/Users/xming/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end

    # Remove history data we don't want to see
    export HISTIGNORE="pwd:ls:cd"

    export {http,https,all}_proxy="http://127.0.0.1:7890"

    function px() {
      export {http,https,all}_proxy="http://127.0.0.1:7890"
    }

    function unpx() {
      unset {http,https,all}_proxy
    }

    function y() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }

    # nix shortcuts
    shell() {
      nix-shell '<nixpkgs>' -A "$1"
    }

    eval "$(zoxide init zsh)"
  '';
}
