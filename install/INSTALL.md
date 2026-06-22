# Installing mrktn.md

`mrktn.md` is installed *into a product's repo* as a local instance that your AI
agent then reads and obeys. There are a few ways — pick one.

---

## Option A — Tell your agent (recommended)

Paste this into Claude Code, Cursor, Antigravity, or any agent that can browse the web:

```text
Set up the mrktn.md marketing doctrine in this repo. Read https://mrktn.md/mrktn.md,
read the profile that matches this product, then interview me about the product, its
stage, ICP, and constraints. Scaffold a local mrktn.md, point AGENTS.md at it, and
govern all marketing decisions by its invariants.
```

The agent reads the doctrine + profile, interviews you, scaffolds the instance, and is bound by it.

### On an agent that can't browse the web (e.g. Claude Cowork)

Sandboxed agents can't fetch URLs — feed them the files instead. Clone the repo
(or download `mrktn.md` plus your profile from `profiles/`), open/connect that
folder, and paste:

```text
Read mrktn.md and the matching profile in ./profiles/ from this folder. Interview me
about the product, its stage, ICP, and constraints, then scaffold a local mrktn.md
and point AGENTS.md at it. Govern all marketing decisions by its invariants.
```

---

## Option B — Command (scaffold a starter file)

```bash
# interactive
curl -fsSL https://mrktn.md/install/mrktn-init.sh | bash

# or non-interactive (e.g. in CI)
curl -fsSL https://mrktn.md/install/mrktn-init.sh | bash -s -- \
  --profile saas-b2b --product "Ledgerly" --stage 2-early-traction --wire-agents
```

This writes a starter `mrktn.md` in the current directory and (with
`--wire-agents`) adds the pointer to `AGENTS.md`. Run `... -- --help` for all
flags. The script never overwrites an existing `mrktn.md` without `--force`.

---

## Option C — Manual

1. Copy [`template.mrktn.md`](./template.mrktn.md) to your repo root as `mrktn.md`.
2. Set `profile:` and `stage:`; fill in **Committed fundamentals**.
3. Add the pointer to `AGENTS.md` (see below).

---

## Wiring it into `AGENTS.md`

So any agent discovers and respects the doctrine, add:

```markdown
## Marketing
Follow the local `mrktn.md` per the mrktn.md standard (https://mrktn.md).
Do not run marketing actions that violate its invariants (I1–I5).
```

That's it. `mrktn.md` governs strategy; your skills/MCP connectors remain the
effectors that carry it out.
