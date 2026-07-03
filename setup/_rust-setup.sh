#!/usr/bin/env bash

echo "Rust Installation setup"

set -euo pipefail

if ! command -v rustup >/dev/null 2>&1; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Updating Rust..."
    rustup update
fi

rustc --version
cargo --version

echo "Rust instalation done"
