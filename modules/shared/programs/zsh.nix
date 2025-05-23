{ pkgs, lib, ... }:
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
      name = "fuckmit";
      file = "zsh-fuckmit.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "mingeme";
        repo = "zsh-fuckmit";
        rev = "main";
        sha256 = "sha256-UUvudz2ICVoOMs20syNnrgvSxwCFhe0wnHOeeH75Nwk=";
      };
    }
    {
      name = "pnpm";
      file = "pnpm.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "ntnyq";
        repo = "omz-plugin-pnpm";
        rev = "main";
        sha256 = "sha256-xFj0A3jQx2LJqnaxpJ6VNXauyJ+JWOiydhUe2zON8n8=";
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

  initContent = lib.mkBefore ''
    if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
      . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
    fi

    export PATH="/opt/homebrew/bin:$PATH"

    export GOBIN="$HOME/go/bin"
    export PATH="$GOBIN:$PATH"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH=$HOME/.local/bin:$PATH
    export PATH=$HOME/.local/share/bin:$PATH

    # My editor
    export ALTERNATE_EDITOR=""
    export EDITOR="nvim"
    export VISUAL="nvim"

    export PATH="/Users/xming/.codeium/windsurf/bin:$PATH"

    # Remove history data we don't want to see
    export HISTIGNORE="pwd:ls:cd"

    export {http,https,all}_proxy="http://127.0.0.1:7890"

    function px() {
      export {http,https,all}_proxy="http://127.0.0.1:7890"
    }

    function unpx() {
      unset {http,https,all}_proxy
    }

    # Load API keys from external file
    if [[ -f "$HOME/.config/api_keys.sh" ]]; then
      source "$HOME/.config/api_keys.sh"
    fi

    # nix shortcuts
    shell() {
      nix-shell '<nixpkgs>' -A "$1"
    }

    eval "$(zoxide init zsh)"
  '';
}
