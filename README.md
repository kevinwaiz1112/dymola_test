# dymola_test (Minimal Reproducible Example)

Dieses Paket ist ein **Minimalbeispiel**, um ein Lizenz-/Feature-Problem mit **Dymola 2026x** auf **Linux** reproduzierbar zu zeigen und mit **Windows** zu vergleichen.

**Beobachtung:**
- **Windows:** Simulation/Übersetzung funktioniert (Lizenz ist in Dymola per GUI „License Setup“ hinterlegt).
- **Linux:** Dymola startet, aber bei “aufwendigeren” Modellen kommt:
  - `You have no licence … only simulate models with 8 or less equations`
  - `model is too complex for the current license`

---

## Inhalt / Struktur

- `external/AixLib/` → AixLib als **mitgelieferter Ordner** (kein Git-Submodule).  
  Wichtig: `external/AixLib/AixLib/package.mo` muss existieren.
- `dymp_api_test.py` → Python-Testskript (ebcpy/DymolaAPI)
- `run_remote.sh` → Runner für Linux (setzt ENV + startet Script)
- `requirements.in` → Python-Abhängigkeiten
- `results/` → Output (wird bei Run erzeugt)

---

## Windows: Setup & Run (Copy & Paste)

### 1) Ordner vorbereiten
Entpacke das ZIP/den Ordner z. B. nach:
`C:\03_Repos\dymola_test`

Prüfe, dass AixLib vorhanden ist:
```powershell
Test-Path .\external\AixLib\AixLib\package.mo

Wenn False, dann liegt AixLib nicht im richtigen Pfad.

2) Virtuelle Umgebung erstellen & Abhängigkeiten installieren
cd C:\03_Repos\dymola_test
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install --upgrade pip
.\.venv\Scripts\python.exe -m pip install -r requirements.in
3) Testlauf starten
cd C:\03_Repos\dymola_test
.\.venv\Scripts\python.exe dymp_api_test.py
Erwartete Outputs (Windows)

Nach einem erfolgreichen Lauf findet ihr typischerweise:

results\resultFile.mat
results\result.csv
results\DymolaAPI.log
Hinweis zur Lizenz (Windows)

Auf Windows kann die Lizenz über die Dymola-GUI unter License Setup hinterlegt sein (persistente Konfiguration). Dann müssen keine Lizenz-Environment-Variablen gesetzt werden.

Linux: Setup & Run (Copy & Paste)
1) Ordner vorbereiten

Entpacke das ZIP/den Ordner z. B. nach:
~/dymola_test

Prüfe, dass AixLib vorhanden ist:

test -f ./external/AixLib/AixLib/package.mo && echo "OK" || echo "MISSING"
2) Virtuelle Umgebung erstellen & Abhängigkeiten installieren
cd ~/dymola_test
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.in
3) Runner ausführbar machen & starten
cd ~/dymola_test
chmod +x run_remote.sh
./run_remote.sh
Erwartete Outputs (Linux)
Bei erfolgreichem Lauf (je nach Lizenz):
results/resultFile.mat, results/result.csv, results/DymolaAPI.log
Bei Lizenzproblem: Log-Ausgaben enthalten i. d. R. die Meldungen:
8 or less equations
model is too complex for the current license