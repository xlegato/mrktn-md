# Installing mrktn.md

`mrktn.md` is installed *into a product's repo* as a local instance that your AI
agent then reads and obeys. There are three ways to do it — pick one.

---

## Option A — Tell your agent (recommended)

Paste this into Claude Code, Cursor, or any coding agent working in your repo:

```text
Set up the mrktn.md marketing doctrine for this project.

1. Read the doctrine at https://mrktn.md/mrktn.md (the core standard).
2. From the list at https://mrktn.md/llms.txt, fetch the profile that best matches
   this product (e.g. https://mrktn.md/profiles/saas-b2b.md).
3. Interview me briefly: what the product is, its type, current lifecycle stage,
   the one ICP, constraints (budget/runway/team), and how success is defined.
4. Create a local `mrktn.md` at the repo root using the template, filled with my
   answers. Pin `extends: mrktn-core@0.2`.
5. Add a "Marketing" section to AGENTS.md that points to the local mrktn.md and
   states that marketing actions must obey its invariants.
6. From now on, govern every marketing decision by the invariants (I1–I5) and
   the reasoning protocol in the doctrine. Refuse actions that violate them.
```

The agent reads the doctrine, scaffolds your instance, and is now bound by it.

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
