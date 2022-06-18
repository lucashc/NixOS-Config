{
  description = "Main System Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      Horizon-Mobile = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          {
            # Main configuration file
            imports = [ ./configuration.nix ];
            nix = {
              # Enable flakes and sandbox support
              extraOptions = "experimental-features = nix-command flakes";
              useSandbox = true;
              
              # Registry
              registry."nixpkgs".flake = nixpkgs;
              registry."p".flake = nixpkgs;
            };
          }
        ];
      };
    };
  };
}
