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

## Windows: Setup & Run 

### 1) Ordner vorbereiten
Entpacke das ZIP/den Ordner z. B. nach:
`C:\03_Repos\dymola_test`

### 2) Virtuelle Umgebung erstellen & Abhängigkeiten installieren
cd C:\03_Repos\dymola_test

python -m venv .venv

.\.venv\Scripts\python.exe -m pip install --upgrade pip

.\.venv\Scripts\python.exe -m pip install -r requirements.in
### 3) Testlauf starten
cd C:\03_Repos\dymola_test

.\.venv\Scripts\python.exe dymp_api_test.py

### Erwartete Outputs (Windows)
results\resultFile.mat

results\result.csv

results\DymolaAPI.log

Hinweis zur Lizenz (Windows)

Auf Windows ist die Lizenz über die Dymola-GUI unter License Setup hinterlegt (persistente Konfiguration). 
Dann müssen keine Lizenz-Environment-Variablen gesetzt werden.

## Linux (Remote): Setup & Run 

### 1) Alte Ordner entfernen + frisch klonen (inkl. AixLib Submodule)

cd ~

rm -rf dymola_test

cd dymola_test

### 2) Python venv erstellen + Abhängigkeiten installieren

python3 -m venv .venv

source .venv/bin/activate

python -m pip install --upgrade pip

pip install -r requirements.in

### 3) Run starten
chmod +x run_remote.sh

./run_remote.sh

### Erwartetes Verhalten / typische Ausgabe (Linux)

Auf Linux erscheint bei uns reproduzierbar die Lizenz-Warnung (Feature-/Seat-Limit):

UserWarning: You have no licence to use Dymola. Hence you can only simulate models with 8 or less equations.

Beispiel-Run (Auszug):

26.03.2026-15:25:05 INFO DymolaAPI: -------------------------Initializing class DymolaAPI-------------------------

26.03.2026-15:25:05 INFO DymolaAPI: Using dymola installation at /opt/dymola-2026x-x86_64

26.03.2026-15:25:05 INFO DymolaAPI: Using dymola.exe: /opt/dymola-2026x-x86_64/bin64/dymola

26.03.2026-15:25:07 INFO DymolaAPI: Loading Model /home/waiz_kv/dymola_test/dymola_test/external/AixLib/AixLib

/home/waiz_kv/dymola_test/dymola_test/.venv/lib/python3.10/site-packages/ebcpy/simulationapi/dymola_api.py:311: 

UserWarning: You have no licence to use Dymola. Hence you can only simulate models with 8 or less equations.

