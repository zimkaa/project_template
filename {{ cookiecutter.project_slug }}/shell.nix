{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = [
    pkgs.python313
    pkgs.stdenv.cc.cc.lib
    pkgs.uv
    pkgs.go-task
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [ 
      pkgs.stdenv.cc.cc.lib 
    ]}
    echo "Activated nix environment with $(python -V)!"
    if [ -f .env ]; then
      echo "Activated .env environment"
      set -a
      source .env
      set +a
    fi
    if [ -d .venv ]; then
      echo "Activated .venv environment"
      source .venv/bin/activate
    else
      echo "Create .venv environment..."
      python -m venv .venv
      source .venv/bin/activate
      echo "Activated .venv environment"
    fi
  '';
}
