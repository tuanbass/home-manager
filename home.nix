# use `man home-configuration.nix` to get manual 

{ config, pkgs,  ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tuanba1";
  home.homeDirectory = "/home/tuanba1";


  imports = [
    ./apps/micro.nix
    ./apps/sioyek.nix
    ./dotfiles.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages =  with pkgs; [
# utilities
    neofetch
    htop
    thefuck
    mcfly
    zsh
    gh
    calc
# term util 
    zellij
    dust
# search  tools
    fd 
    silver-searcher
    fzf 
    ripgrep
# network tools
    nettools
    axel
    mise
    bat
    fh
# programming tools
    jq
    yq-go
    pgcli
    mycli
    # vscode # unfree
    virtualbox # TODO: add desktop file for it 
    gitflow
    # docker  # TODO: need to research how to correct install docker in nix. see: https://medium.com/thelinux/how-to-install-the-docker-in-nixos-with-simple-steps-226a7e9ef260  
    # vagrant # notfree
    # postman # it's not free
    act
# k8s tools
    k9s
    # tanka    # manual install latest version
    jsonnet-bundler
# Others
    fastfetch
    awscli2
    antidote
    lazygit
    doublecmd
    nnn
    ags
    # discord # unfree, require export NIXPKGS_ALLOW_UNFREE=1 and home-manager switch --impure 
    # spotify #require export NIXPKGS_ALLOW_UNFREE=1, --impure
    # github-desktop # Cannot work yet. App not worth to use at all
    # spotify-qt  # Select one spotify client only
    # sioyek   # seem 
    # warpd
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.file."test.txt".text = "Hello, world!";
  home.file."test2.txt".source = ./manifest/test.txt;

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tuanba1/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # LOCALE_ARCHIVE = "/usr/lib/locale/locale-archive"
    EDITOR1 = "emacs1";
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;
  programs.home-manager = {
      enable = true;
    };



}

