{ config, pkgs, ... }:

let user = "xming"; in

{
  imports = [
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
  ];

  nix = {
    package = pkgs.nix;

    settings = {
      trusted-users = [ "@admin" "${user}" ];
      substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    };

    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system = {
    stateVersion = 4;
    checks.verifyNixPath = false;
  };

  # 设置正确的 nixbld 组 ID 来解决 GID 不匹配问题
  ids.gids.nixbld = 350;

  environment.systemPackages = with pkgs; [
    neovim
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });
}