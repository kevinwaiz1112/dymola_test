@'
$ErrorActionPreference = "Stop"

# License server (match Dymola GUI setting)
$env:LM_LICENSE_FILE = "kpfiler4.intra.dlr.de"
$env:DSLS_LICENSE_FILE = $env:LM_LICENSE_FILE
$env:DYMOLA_LICENSE_FILE = $env:LM_LICENSE_FILE

# Activate venv
.\.venv\Scripts\Activate.ps1

python .\dymp_api_test.py
'@ | Out-File -Encoding utf8 run_windows.ps1