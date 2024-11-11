{ config, pkgs, ... }:
 {
  # import `dotfiles config` dir into ~/.config
  home.file."${config.xdg.configHome}" = {
    source = ./dotfiles/.config;
    recursive = true;
  };

 
# some file to home folder 
# TODO: make it autoscan 
# home.file = builtins.attrsets.mapAttrs (n: v: {
#   source = ./dotfiles/"${n}";
#   recursive = true;
# }) (builtins.readDir ./dotfiles/);

  # vrapper config for vim keybindings in eclipse base editors
  # like DBEaver
  home.file.".vrapperrc" = {
    source = ./dotfiles/home/.vrapperrc;
    recursive = true;
  };

  home.file.".xkb" = {
    source = ./dotfiles/home/.xkb;
    recursive = true;
  };

}



# let
#   dotfiles = pkgs.lib.attrsets.mapAttrsToList (n: v: {
#     target = ".${n}";
#     source = "${./dotfiles}/${n}";
#     # recursive = true;
#   }) (builtins.readDir ./dotfiles);
# in
# {
#   builtins.trace "dotfiles:" "dot" ;
#   home.file = builtins.listToAttrs dotfiles;
# }
