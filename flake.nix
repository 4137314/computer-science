{
  description = "Computer science courses: knowledge base of C++, Java and digital design";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Emacs reader for the knowledge base (study/): separate repository, shared with
    # other projects.
    knowledge-base = {
      url = "git+ssh://git@github.com/4137314/knowledge-base";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, knowledge-base }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Reader for study/kb: command computer-science-study, server "computer-science",
      # state in ~/.local/state/computer-science-emacs; domains, areas and forbidden
      # words in study/kb-config.el.
      study = knowledge-base.lib.mkReader pkgs {
        name = "computer-science";
        notes = "study/kb";
        config = "study/kb-config.el";
        rootVar = "CS_ROOT";
      };
    in {
      packages.${system} = {
        inherit study;
        default = study;
      };

      apps.${system}.default = {
        type = "app";
        program = "${study}/bin/computer-science-study";
      };

      # Toolchains for the three courses: C++ (g++), Java with JavaFX, VHDL (GHDL + GTKWave).
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          gnumake
          gcc
          gdb
          jdk21
          openjfx21
          ghdl
          gtkwave
        ];
        shellHook = ''
          echo "computer-science: make help (knowledge base: make study)"
        '';
      };
    };
}
