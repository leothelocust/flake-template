{
  description = "A basic nodejs flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        nativeBuildInputs = [ pkgs.bashInteractive ];
        buildInputs = [
          pkgs.nodejs-16_x

          pkgs.nodePackages.pnpm # the latest and greatest package manager
          #  or
          # pkgs.yarn

          # pkgs.nodePackages.typescript
          # pkgs.nodePackages.typescript-language-server
        ];
      };
    });
}
