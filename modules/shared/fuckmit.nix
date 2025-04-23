{
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.programs.fuckmit;
  zshIntegration = ''
    source <(fuckmit completion zsh)
  '';

in

{
  options.programs.fuckmit = {
    enable = mkEnableOption "The fuckmit program";

    package = mkOption {
      type = types.package;
      default = pkgs.fuckmit;
    };

    enableZshIntegration = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    programs.zsh.initContent = mkIf cfg.enableZshIntegration (mkAfter zshIntegration);
  };
}
