{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = [
    pkgs.python313
    pkgs.uv
    pkgs.go-task
    # pkgs.python310Packages.pandas
  ];  # Указываем зависимости для devShell
  shellHook = ''
    echo "Activated nix environment with $(python -V)!"
    if [ -f .env ]; then
      export $(grep -v '^#' .env | xargs)
    fi
    if [ -f .venv ]; then
      echo "Activated .venv environment"
      source .venv/bin/activate
    else
      echo "Create .venv environment..."
      task install
      source .venv/bin/activate
      echo "Activated .venv environment"
    fi
  '';
}
