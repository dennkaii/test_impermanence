{
  description = "Nyxmaterium";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = {nixpkgs,...}@inputs:
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        inputs.impermanence.nixosModules.impermanence
        ];
    };
  };
}
