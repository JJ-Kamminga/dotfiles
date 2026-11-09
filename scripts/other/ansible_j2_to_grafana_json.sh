#!/usr/bin/env bash
#
# convert_grafana_template.sh
#
# Usage:
#   ./convert_grafana_template.sh <input_template.j2> [output.json]
#
# Description:
#   • Strips Jinja2 raw/endraw tags.
#   • Replaces the Prometheus datasource block with a placeholder UID.
#   • Replaces the Loki datasource block with a placeholder UID.
#   • Substitutes {{ grafana_orgs_name }} with the literal string TEST_ORG.
#
# The script works line‑by‑line with `sed`, preserving indentation
# and handling multi‑line JSON objects safely via the “hold space”.
#!/usr/bin/env bash
set -euo pipefail

die() { printf 'Error: %s\n' "$*" >&2; exit 1; }

[[ $# -ge 1 && $# -le 2 ]] || die "Usage: $0 <input.j2> [output.json]"

INFILE=$1
OUTFILE=${2:-"${INFILE%.j2}.json"}
[[ -f "$INFILE" ]] || die "File not found: $INFILE"

# Force GNU sed even if /usr/bin/sed is BSD sed (common on macOS)
# You can install gnu-sed via brew (`brew install gnu-sed`) and call it as `gsed`.
SED_CMD=$(command -v gsed || command -v sed)

"$SED_CMD" -z \
    -e 's/{%[[:space:]]*raw[[:space:]]*%}//gI' \
    -e 's/{%[[:space:]]*endraw[[:space:]]*%}//gI' \
    -e 's/"datasource"[[:space:]]*:[[:space:]]*{[[:space:]]*"type"[[:space:]]*:[[:space:]]*"prometheus",[[:space:]]*"uid"[[:space:]]*:[[:space:]]*"{{ mimir_ds_uid }}*"[[:space:]]*}/"datasource": {\
            "type": "prometheus",\
            "uid": "edp1msczwh1xcb"\
          }/gI' \
    -e 's/"datasource"[[:space:]]*:[[:space:]]*{[[:space:]]*"type"[[:space:]]*:[[:space:]]*"loki",[[:space:]]*"uid"[[:space:]]*:[[:space:]]*"{{ loki_ds_uid }}*"[[:space:]]*}/"datasource": {\
            "type": "loki",\
            "uid": "fdwv1bxudplvkf"\
          }/gI' \
    -e 's/{{[[:space:]]*grafana_orgs_name[[:space:]]*}}/TEST_ORG/g' \
    "$INFILE" > "$OUTFILE"

printf '✅ Done – output written to %s\n' "$OUTFILE"