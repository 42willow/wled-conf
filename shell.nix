{pkgs ? import <nixpkgs> {}}: let
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.python39
      pkgs.python39Packages.pip
      pkgs.platformio
      # optional: for esp32
      pkgs.avrdude
    ];

    shellHook = ''
      if [ ! -d ".venv" ]; then
        python -m venv .venv
      fi
      source .venv/bin/activate
    '';
  }
