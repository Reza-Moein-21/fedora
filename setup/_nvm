#!/usr/bin/env bash

set -euo pipefail

# =========================================================
# Install NVM
# =========================================================
if [ -d "${HOME}/.nvm" ]; then
    echo "✓ NVM is already installed. Skipping."
else
    echo "Installing NVM..."
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
fi
