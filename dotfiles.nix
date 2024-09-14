{ config, pkgs, ... }:
{
  # import `dotfiles` dir into ~/.config
  home.file."${config.xdg.configHome}" = {
    source = ./dotfiles;
    recursive = true;
  };


}
