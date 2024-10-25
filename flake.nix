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
    devShells.aarch64-darwin.default = pkgs.mkShell {
      packages = [
        pkgs.python312
        pkgs.uv
        # pkgs.python310Packages.pandas
      ];  # Указываем зависимости для devShell
      shellHook = ''
        echo "Activated nix environment with $(python -V)!"
        if [ -f .env ]; then
          export $(grep -v '^#' .env | xargs)
        fi
        # if [ -f .venv ]; then
        #   echo "Activated .venv environment"
        #   source .venv/bin/activate
        # else
        #   echo "Create .venv environment..."
        #   python -m venv .venv
        #   source .venv/bin/activate
        #   echo "Activated .venv environment"
        # fi
        export SHELL=$(which zsh)
        exec $SHELL
      '';
    };
  };
}
