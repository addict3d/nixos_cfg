{ config, pkgs, ... }:

let
  nodePkgs = with pkgs.nodePackages; [
    grunt-cli
    node2nix
  ];

in
  {
    imports = [
      ./documentation
      ./languages
      ./perf
      ./channels.nix
    ];

    environment.systemPackages = with pkgs; [
      # js
      nodejs-10_x
      sass

      exercism
      nodePackages."@angular/cli"

      # debugging
      gdb
      lldb

      cmake
      gnumake

      unstable.postman

      maven3

      # testing
      websocat

      pypi2nix
    ]
    ++ nodePkgs;
  }
