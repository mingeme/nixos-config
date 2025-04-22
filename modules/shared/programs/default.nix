{
  config,
  pkgs,
  lib,
  user,
  ...
}:

let
  importProgram =
    modulePath:
    import modulePath {
      inherit
        config
        pkgs
        lib
        user
        ;
    };
in
{
  fzf = importProgram ./fzf.nix;
  gh = importProgram ./gh.nix;
  git = importProgram ./git.nix;
  go = importProgram ./go.nix;
  neovim = importProgram ./neovim.nix;
  ssh = importProgram ./ssh.nix;
  tmux = importProgram ./tmux.nix;
  vim = importProgram ./vim.nix;
  zsh = importProgram ./zsh.nix;
  direnv = importProgram ./direnv.nix;
}
