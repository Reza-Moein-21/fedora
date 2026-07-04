#!/usr/bin/env bash

set -euo pipefail

# =========================================================
# Install SDKMAN!
# =========================================================
if [ -d "${HOME}/.sdkman" ]; then
    echo "✓ SDKMAN! is already installed. Skipping."
else
    echo "Installing SDKMAN!..."
    curl -fsSL https://get.sdkman.io | bash
fi
