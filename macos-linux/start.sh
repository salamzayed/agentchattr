#!/usr/bin/env bash
# agentchattr — starts the server only
cd "$(dirname "$0")/.."

# Auto-create venv and install deps on first run
if [ ! -d ".venv" ]; then
    # tomllib requires Python 3.11+; prefer python3.12 if available
    PY=$(command -v python3.12 || command -v python3.11 || command -v python3)
    "$PY" -m venv .venv
    .venv/bin/pip install -q -r requirements.txt > /dev/null 2>&1
fi
source .venv/bin/activate

python run.py
echo ""
echo "=== Server exited with code $? ==="
