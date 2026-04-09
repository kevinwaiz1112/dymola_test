#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

D=/opt/dymola-2026x-x86_64
export DYMOLA="$D"
export LM_LICENSE_FILE=kpfiler4.intra.dlr.de
export DSLS_LICENSE_FILE="$LM_LICENSE_FILE"
export DYMOLA_LICENSE_FILE="$LM_LICENSE_FILE"
export QT_QPA_PLATFORM=offscreen
export LD_LIBRARY_PATH="$D/bin/lib64:$D/bin/lib:$D/bin64:${LD_LIBRARY_PATH:-}"
export DYMOLA_USERHOME="$HOME/.dassaultsystemes/dymola/2026x"
export TMPDIR="$HOME/tmp"
mkdir -p "$DYMOLA_USERHOME" "$TMPDIR"

DYMOLA_EXE="$D/bin64/dymola"
MOS_FILE="$SCRIPT_DIR/simulate_example.mos"

if [ ! -x "$DYMOLA_EXE" ]; then
  echo "Dymola nicht gefunden oder nicht ausfuehrbar:"
  echo "$DYMOLA_EXE"
  exit 1
fi

if [ ! -f "$MOS_FILE" ]; then
  echo "MOS-Datei nicht gefunden:"
  echo "$MOS_FILE"
  exit 1
fi

cd "$SCRIPT_DIR"
mkdir -p results

echo "[1] Starte Dymola headless..."
echo "[2] Arbeitsordner: $SCRIPT_DIR"
echo "[3] MOS: $MOS_FILE"
echo "[4] DYMOLA: $DYMOLA_EXE"
echo "[5] LM_LICENSE_FILE: $LM_LICENSE_FILE"

timeout 60s "$DYMOLA_EXE" -NoWindow "$MOS_FILE" > results/dymola_cli_stdout.log 2>&1 || true

echo "[6] Dymola-Aufruf beendet."
