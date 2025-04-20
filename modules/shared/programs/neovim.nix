{ pkgs, ... }:

{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = [ pkgs.vimPlugins.lazy-nvim ]; 
  extraConfig = ''
  '';
}
