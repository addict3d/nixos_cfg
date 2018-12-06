{ config, pkgs, ... }:
let
  jetPkgs = with pkgs.unstable.jetbrains; [
    clion
    idea-ultimate
    jdk
    phpstorm
    pycharm-professional
    webstorm
  ];

in
  {

    imports = [
      ./design.nix
      ./media.nix
      ./nvidia.nix
      ./notifications.nix
      ./qt.nix
      ./social.nix
      ./unstable.nix
      ./wireshark.nix
      ];

          # List packages installed in system profile. To search, run:
          # $ nix search wget
          environment.systemPackages = with pkgs; [
            # system utilities
            ripgrep
            ag
            autojump
            wget
            jq
            pdfgrep
            zstd
            multitail
            fd
            cachix
            btrfs-progs

            # editors
            (import ./vim/vim.nix)
            (import ./vim/neovim.nix)

            # browsers
            unstable.chromiumDev
            firefox

            # dev
            gitAndTools.gitFull


            # compilers / toolchains
            gcc
            rustup
            stack

            # nix
            binutils
            nix
            nox

            # xmonad
            xmonad-log

            # Setup: Encountered missing dependencies:
            # xmonad >=0.11 && <0.13, xmonad-contrib >=0.11 && <0.13
            #haskellPackages.xmonad-contrib-gpl

            # misc DM/DE
            trayer
            rofi
            xscreensaver
            maim
            xtrlock-pam
            xclip
            xorg.xbacklight

            # terminals
            kitty

            # vcs
            gitkraken

            # pass management
            _1password

            #ghcPkgs
          ]
          ++ jetPkgs
          ;
        }
