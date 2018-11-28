self: super: 
with super.lib;
let
  # Using the nixos plumbing that's used to evaluate the config...
  eval = import <nixpkgs/nixos/lib/eval-config.nix>;
    # Evaluate the config ...
    paths = (eval {modules =[(import <nixos-config>)];})
    # then get the `nixpkgs.overlay` option.
    .config.nixpkgs.overlays
    ;
in
  foldl' (flip extends) ( : super) paths self
