{pkgs ? import <nixpkgs> {}}: let
in
  pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (python-pkgs:
        with python-pkgs; [
          pip
          pyyaml
          zopfli
          wheel
        ]))
    ];
    buildInputs = [
      pkgs.python3

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
