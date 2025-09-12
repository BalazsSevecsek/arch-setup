#!/bin/bash

curl -fsSL https://pyenv.run | bash

#only if it does not already contain it
grep -qxF 'export PYENV_ROOT="$HOME/.pyenv"' ~/.zshrc || echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
grep -qxF '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' ~/.zshrc || echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
grep -qxF 'eval "$(pyenv init - zsh)"' ~/.zshrc || echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
