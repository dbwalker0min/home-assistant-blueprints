import json, io, re, html

LOG_PATH = "/config/home-assistant.log"
LOGGER   = "blueprint.test"   # your custom logger
MAX_BYTES = 200_000
MAX_ROWS  = 200

# 2025-10-19 13:42:17 WARNING (MainThread) [blueprint.test] Message...
LINE = re.compile(
    r"^(?P<ts>\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})\s+"
    r"(?P<lvl>[A-Z]+)\s+\([^)]+\)\s+\[(?P<log>[^\]]+)\]\s+(?P<msg>.*)$"
)

def sev(level: str) -> str:
    level = level.upper()
    if level in ("ERROR","CRITICAL"): return "error"
    if level == "WARNING":            return "warning"
    if level == "DEBUG":              return "info"     # closest match
    return "info"  # INFO/default

status = "OK"
rows = []
try:
    with io.open(LOG_PATH, "rb") as f:
        try:
            f.seek(-MAX_BYTES, io.SEEK_END)
        except Exception:
            f.seek(0)
        data = f.read().decode("utf-8", "ignore")
    for line in data.splitlines():
        m = LINE.match(line)
        if not m or m.group("log") != LOGGER:
            continue
        rows.append((m.group("ts"), m.group("lvl"), m.group("msg")))
except Exception as e:
    status = f"Error: {e}"

# Build ha-alert HTML (newest last; use rows[-MAX_ROWS:][::-1] for newest first)
alerts = []
for ts, lvl, msg in rows[-MAX_ROWS:]:
    alerts.append(
        f"<ha-alert severity='{sev(lvl)}' title='{html.escape(ts)} • {lvl}'>"
        f"{html.escape(msg)}</ha-alert>"
    )

html_blob = "".join(alerts) or "<ha-alert severity='info'>No blueprint.test entries yet</ha-alert>"

print(json.dumps({"status": status, "count": len(rows), "html": html_blob}))
