import json
from pathlib import Path

BOARD_MARKER = "| Task |"
ROOT = Path(__file__).resolve().parent.parent
CANDIDATES = [ROOT / "TASK_BOARD.md", ROOT.parent / "TASK_BOARD.md"]
TASK_BOARD = next((path for path in CANDIDATES if path.exists()), None)
if TASK_BOARD is None:
    raise FileNotFoundError("No se encontró TASK_BOARD.md en la raíz del repo o en el directorio contenedor")

OUTPUT = ROOT / "site" / "data" / "board.json"

lines = TASK_BOARD.read_text(encoding="utf-8").splitlines()
headers = []
rows = []
collecting = False
for line in lines:
    if line.startswith(BOARD_MARKER) and not collecting:
        headers = [column.strip() for column in line.strip().strip("|").split("|")]
        collecting = True
        continue
    if collecting:
        if line.strip().startswith("|---") or line.strip() == "":
            continue
        if line.strip().startswith("|"):
            cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
            if len(cells) < len(headers):
                cells += [""] * (len(headers) - len(cells))
            rows.append(dict(zip(headers, cells)))
        else:
            break

if not rows:
    raise ValueError("No se encontraron filas en la tabla del task board")

OUTPUT.parent.mkdir(parents=True, exist_ok=True)
OUTPUT.write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")
print(f"Exported {len(rows)} tareas a {OUTPUT}")
