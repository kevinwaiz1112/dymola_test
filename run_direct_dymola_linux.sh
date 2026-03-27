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

if [ ! -x "$DYMOLA_EXE" ]; then
  echo "Dymola nicht gefunden oder nicht ausfuehrbar:"
  echo "$DYMOLA_EXE"
  exit 1
fi

cd "$SCRIPT_DIR"
mkdir -p results

"$DYMOLA_EXE" /nowindow "$SCRIPT_DIR/simulate_example.mos"