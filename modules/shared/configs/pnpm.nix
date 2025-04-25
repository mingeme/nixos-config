{
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.programs.pnpm;
  zshIntegration = ''
    export PNPM_HOME="$HOME/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    source <(pnpm completion zsh)
  '';

in

{
  options.programs.pnpm = {
    enable = mkEnableOption "The pnpm program";

    package = mkOption {
      type = types.package;
      default = pkgs.pnpm;
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
