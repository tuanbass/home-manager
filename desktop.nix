# Populate desktop (shortcut) files for app
{ config, pkgs, ... }:
 {
  # import `dotfiles config` dir into ~/.config
  home.file.".local/share/applications" = {
    source = ./desktop;
    recursive = true;
  };

}
