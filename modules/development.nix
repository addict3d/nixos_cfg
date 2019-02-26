{ config, pkgs, ... }:

let
  nodePkgs = with pkgs.nodePackages; [
    grunt-cli
    node2nix
  ];

in
  {
    imports = [
      ./languages
    ];

    environment.systemPackages = with pkgs; [
      # js
      nodejs-10_x
      sass
      php # for cgi, etc


      exercism

      # debugging
      gdb
      lldb

      cmake
      gnumake

      postman

      maven3
    ]
    ++ nodePkgs;
  }