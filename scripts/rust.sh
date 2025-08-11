#!/bin/bash


# Check if Rust is already installed
if ! rustup --version; then
    echo "Rust is not installed, installing now..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile complete
    cargo install stylua --features luajit
    sed -i.bak '/^export PATH=/ {
      /$HOME\/\.cargo\/bin/ ! s/"$/:\$HOME\/.cargo\/bin"/
    }' ~/.zshrc
    source "$HOME/.cargo/env"
else
    echo "Rust is already installed, skipping installation."
    exit 0
fi
