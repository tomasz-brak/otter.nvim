#!/usr/bin/env bash
set -euo pipefail

# run from repo root (script lives in NOTCOMMIT/)

# Start Neovim without your user's init file (keep default runtimepath),
# add the repo root to &runtimepath so lua/ and plugin/ are visible,
# then run the lua activation and window commands you requested.
exec nvim \
  -c 'set rtp+=.' \
  -c "lua require('otter').activate()" \
  "./tests/examples/03c.md"
