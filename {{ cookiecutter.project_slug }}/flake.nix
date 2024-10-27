{
  description = "Envitonment for project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  {
    devShells = {
      aarch64-darwin = let 
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
      in {
        default = import ./shell.nix { inherit pkgs; };
      };
      x86_64-linux = let 
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in {
        default = import ./shell.nix { inherit pkgs; };
      };
    };
  };
}
