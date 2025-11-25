{
  description = "Python Flask IO";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      pythonEnv = pkgs.python3.withPackages (ps: [
        ps.flask
        ps.pandas
        ps.scikit-learn
        ps.joblib
        ps.pipdeptree
        ps.pip
      ]);
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [
          pythonEnv
        ];

        nativeBuildInputs = [
          pkgs.pyright
          pkgs.black
        ];

        shellHook = ''
          echo "Nix shell for Python Flask loaded."

          if [ ! -d ".venv" ]; then
            ${pythonEnv.interpreter} -m venv .venv
          fi
          source .venv/bin/activate
        '';
      };
    };
}
