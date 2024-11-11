{
  description = "Home Manager configuration of tuanba1";
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    # "vagrant" 
    # ];
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # mise = {
    #   url = "github:jdx/mise";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };

    # import from github. ref: https://www.reddit.com/r/Nix/comments/15hy5sa/home_manager_how_to_add_package_from_github_to_my/?rdt=49986
    ags = {
      url = "github:Aylur/ags";
    };
      
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # virtualisation.docker.enable = true;
      homeConfigurations."tuanbass" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
