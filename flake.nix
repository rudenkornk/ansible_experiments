{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # Bootstrap python & python packages.
          python311
          uv

          # Test
          docker
          # qemu_full
          # vagrant

          # Format & lint tools.
          git
          gitleaks
          markdownlint-cli2
          nixfmt
          prettier
          ruff
          shellcheck
          shfmt
          statix
          stylua
          typos
        ];

        shellHook = ''
          uv sync
          source .venv/bin/activate
          source .envrc
          echo "Welcome to the project devshell!"
        '';
      };
    };
}
