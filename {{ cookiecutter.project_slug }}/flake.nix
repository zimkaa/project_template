{
  description = "Envitonment for project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    # Подключаем nixpkgs для конкретной системы
    pkgs = import nixpkgs {
      system = "aarch64-darwin";
    };
  in  {
    devShells.aarch64-darwin.default = import ./shell.nix { inherit pkgs; };
  };
}
