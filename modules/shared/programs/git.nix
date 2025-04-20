{ config, pkgs, lib, user, ... }:

let
  name = "mingeme";
  email = "heminghu00@126.com";
in
{
  enable = true;
  ignores = [ "*.swp" ".DS_Store" ];
  userName = name;
  userEmail = email;
  lfs = {
    enable = true;
  };
  extraConfig = {
    init.defaultBranch = "main";
    push.autoSetupRemote = true;
    core = {
      editor = "nvim";
      autocrlf = "input";
    };
    pull.rebase = true;
    rebase.autoStash = true;
  };
}
