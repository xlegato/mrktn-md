#!/usr/bin/env bash
# mrktn-init — scaffold a local mrktn.md marketing-doctrine instance.
# Part of the mrktn.md standard · https://mrktn.md · CC BY 4.0
set -euo pipefail

CORE_VERSION="mrktn-core@0.2"
PROFILES="saas-b2b saas-b2c mobile-app ecommerce marketplace creator-personal-brand"
STAGES="0-ideation 1-pre-pmf 2-early-traction 3-growth 4-scale"

DEST="mrktn.md"
PROFILE=""
PRODUCT=""
STAGE="0-ideation"
FORCE=0
WIRE_AGENTS=0

usage() {
  cat <<EOF
mrktn-init — scaffold a local mrktn.md instance

Usage: mrktn-init.sh [options]

Options:
  --profile <id>     One of: ${PROFILES// /, }
  --product <name>   Product name (default: current directory name)
  --stage <id>       One of: ${STAGES// /, }   (default: 0-ideation)
  --dest <path>      Output file (default: ./mrktn.md)
  --wire-agents      Append a Marketing pointer to AGENTS.md
  --force            Overwrite an existing instance file
  -h, --help         Show this help

Piped use:
  curl -fsSL https://mrktn.md/install/mrktn-init.sh | bash -s -- --profile saas-b2b
EOF
}

# --- parse flags ---
while [ $# -gt 0 ]; do
  case "$1" in
    --profile) PROFILE="${2:-}"; shift 2 ;;
    --product) PRODUCT="${2:-}"; shift 2 ;;
    --stage)   STAGE="${2:-}";   shift 2 ;;
    --dest)    DEST="${2:-}";    shift 2 ;;
    --wire-agents) WIRE_AGENTS=1; shift ;;
    --force)   FORCE=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

# --- read from the terminal even when the script is piped via curl ---
ask() { # <prompt> <varname>
  local prompt="$1" __var="$2" ans=""
  if [ -r /dev/tty ]; then
    printf "%s" "$prompt" > /dev/tty
    read -r ans < /dev/tty || true
  fi
  printf -v "$__var" "%s" "$ans"
}

contains() { case " $1 " in *" $2 "*) return 0 ;; *) return 1 ;; esac; }

# --- profile ---
if [ -z "$PROFILE" ]; then
  echo "Profiles: ${PROFILES// /, }"
  ask "Choose a profile: " PROFILE
fi
if ! contains "$PROFILES" "$PROFILE"; then
  echo "Error: unknown profile '$PROFILE'. Choose one of: ${PROFILES// /, }" >&2
  exit 1
fi

# --- stage ---
if ! contains "$STAGES" "$STAGE"; then
  echo "Error: unknown stage '$STAGE'. Choose one of: ${STAGES// /, }" >&2
  exit 1
fi

# --- product ---
if [ -z "$PRODUCT" ]; then
  default_product="$(basename "$(pwd)")"
  ask "Product name [$default_product]: " PRODUCT
  PRODUCT="${PRODUCT:-$default_product}"
fi

# --- guard existing file ---
if [ -e "$DEST" ] && [ "$FORCE" -ne 1 ]; then
  echo "Error: $DEST already exists. Re-run with --force to overwrite." >&2
  exit 1
fi

TODAY="$(date +%F)"

# --- write the instance ---
cat > "$DEST" <<EOF
# mrktn.md — ${PRODUCT} (local instance)

<!-- Living marketing doctrine. Keep it SHORT and STRATEGIC. Fundamental bets and
     their reasoning only — not live campaigns, not raw metrics. https://mrktn.md -->

\`\`\`yaml
extends: ${CORE_VERSION}
profile: ${PROFILE}
also: []
product: ${PRODUCT}
stage: ${STAGE}
last_reviewed: ${TODAY}
\`\`\`

## Position

<!-- One paragraph: where the product is, and the single most important thing now. -->

## Committed fundamentals

- **Positioning:**
- **ICP (one):**
- **Primary loop:**
- **Constraints:**
- **Definition of success (this stage):**

## Ruled out / anti-goals

-

## Marketing Decision Record

\`\`\`yaml
- date: ${TODAY}
  decision:
  stage: ${STAGE}
  rationale:
  expected_outcome:
    metric:
    target:
    box:
  reversal_condition:
  status: open
\`\`\`

## Open experiments

\`\`\`yaml
- hypothesis:
  primary_metric:
  target:
  box:
  kill_criteria:
  status:
\`\`\`
EOF

echo "Created $DEST  (profile: $PROFILE, stage: $STAGE)"

# --- optionally wire AGENTS.md ---
if [ "$WIRE_AGENTS" -eq 1 ]; then
  if [ -f AGENTS.md ] && grep -qi "mrktn.md standard" AGENTS.md; then
    echo "AGENTS.md already references mrktn.md — skipped."
  else
    cat >> AGENTS.md <<'EOF'

## Marketing
Follow the local `mrktn.md` per the mrktn.md standard (https://mrktn.md).
Do not run marketing actions that violate its invariants (I1–I5).
EOF
    echo "Wired pointer into AGENTS.md"
  fi
fi

cat <<EOF

Next:
  1. Open $DEST and fill in Committed fundamentals.
  2. Read your profile: https://mrktn.md/profiles/${PROFILE}.md
  3. Point your agent at it (see https://mrktn.md/install/INSTALL.md, Option A).
EOF
