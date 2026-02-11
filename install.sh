#!/bin/bash
set -e
git clone https://github.com/$(git config user.name 2>/dev/null || echo "USER")/clanker ~/.clanker 2>/dev/null || true
chmod +x ~/.clanker/clanker
[ -f ~/.clanker/.env ] || echo 'OPENAI_API_KEY="your-key-here"' > ~/.clanker/.env

# Add to PATH if not already there
if ! echo "$PATH" | grep -q "$HOME/.clanker"; then
  SHELL_RC="$HOME/.bashrc"
  [ -n "$ZSH_VERSION" ] && SHELL_RC="$HOME/.zshrc"
  echo 'export PATH="$HOME/.clanker:$PATH"' >> "$SHELL_RC"
  echo "Added ~/.clanker to PATH in $SHELL_RC — restart your shell or run: source $SHELL_RC"
fi

echo "clanker installed. Set your API key in ~/.clanker/.env"
