#!/bin/bash


# Check if Rust is already installed
if ! command -v rustup >/dev/null 2>&1; then
    echo "Rust is not installed, installing now..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile complete
    source "$HOME/.cargo/env"
    cargo install stylua --features luajit
else
    echo "Rust is already installed, skipping installation."
    exit 0
fi
