{
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.programs.fnm;
  zshIntegration = ''
    eval "$(fnm env --use-on-cd --shell zsh)"
    source <(fnm completions --shell zsh)
  '';

in

{
  options.programs.fnm = {
    enable = mkEnableOption "The fnm program";

    package = mkOption {
      type = types.package;
      default = pkgs.fnm;
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
