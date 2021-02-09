#!/usr/bin/env bash
echo "Entering nix shell"
nix-shell -I nixpkgs=channel:nixos-18.03
