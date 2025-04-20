{ config, pkgs, lib, user, ... }:

let
  # Get all .nix files from the programs directory
  programsDir = ./programs;
  # Filter for only .nix files
  programFiles = lib.filterAttrs (n: v: v == "regular" && lib.hasSuffix ".nix" n) (builtins.readDir programsDir);
  # Import all program modules
  importProgram = name: {
    name = lib.removeSuffix ".nix" name;
    trace = builtins.trace "importing program: ${name}";
    value = import (programsDir + "/${name}") { inherit config pkgs lib user; };
  };
  programModules = lib.listToAttrs (map importProgram (builtins.attrNames programFiles));
in
{
  # Export all program configurations as an attribute set
  # This makes it compatible with the way it's imported in darwin/home-manager.nix
  # and nixos/home-manager.nix
  programs = programModules;
}
