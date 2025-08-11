#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile complete
source ~/.zshrc
cargo install stylua --features luajit
cargo install clippy
