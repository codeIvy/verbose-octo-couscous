{
  description = "Codex and local-rag environment with Node.js 22";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_22
          codex
        ] ;

        shellHook = ''
          export BASE_DIR="$PWD"

          alias hcx='headroom wrap codex'

          echo "Node: $(node --version)"
          echo "npm:  $(npm --version)"
          echo "Use 'hcx' to run Codex through Headroom."
        '';
      };
    };
}
