#!/bin/bash

#check if zshrc exists and contains line starting with "export NVM_DIR"
if [[ ! -f "$HOME/.zshrc" ]] || ! grep -q "^export NVM_DIR=" "$HOME/.zshrc"; then
    echo "NVM_DIR not set in .zshrc, installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
else
    echo "NVM_DIR already set in .zshrc, skipping nvm installation"
fi

#curl -fsSL https://deno.land/install.sh | sh
#curl -fsSL https://bun.sh/install | bash