{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs.haskellPackages; [
    base
    brick
    containers
    extra
    lens
    linear
    mtl
    random
    transformers
    vty
    vty-crossplatform
    directory
    filepath
    optparse-applicative
    cabal-install
    stack
  ];

  shellHook = ''
    # Set up the environment for Stack
    export STACK_ROOT=$PWD/.stack
    export PATH=$STACK_ROOT/bin:$PATH

    # Ensure the project is built with Stack
    stack build
  '';
}

