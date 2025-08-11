#!/bin/bash


# Check if Rust is already installed
if ! rustup --version; then
    echo "Rust is not installed, installing now..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile complete
    cargo install stylua --features luajit
    #uncomment path export if needed
    sed -i.bak '/^# export PATH=/ s/^# //' ~/.zshrc
    # Add Rust to PATH if not already present
    sed -i.bak '/^export PATH=/ {
      /\$HOME\/\.cargo\/bin/! s/:$PATH"/:$HOME\/.cargo\/bin:$PATH"/
    }' ~/.zshrc
    source ~/.zshrc
else
    echo "Rust is already installed, skipping installation."
    exit 0
fi
