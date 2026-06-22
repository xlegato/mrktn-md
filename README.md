# mrktn.md

**The open marketing doctrine for AI agents.**
Measurement first. Fundamentals always. Scale only what survives the math.

[Read the doctrine →](./mrktn.md) · [Install →](./install/INSTALL.md) ·
[Profiles →](./profiles) · [mrktn.md](https://mrktn.md) · License: CC BY 4.0

---

## The problem

Agents can already *operate* every ad platform — there's a connector or skill for
each one. What they're missing is **judgment**: knowing what to do, and what
*not* to do, based on where a product actually is in its life.

So builders treat marketing as an afterthought. They point a TikTok-Ads MCP at a
pre-product idea, add budget, and expect growth. They either get bad results — or
they win the lottery once and conclude they're good at marketing. The whole field
stays unscientific because nobody separates luck from skill.

The knowledge that prevents this exists. It's just been **closed** — locked in
agencies, senior operators, and expensive engagements. `mrktn.md` opens it.

## What it is

`mrktn.md` is **not a skill** — skills and connectors are *effectors* (hands).
`mrktn.md` is the *brain* that decides which hand to use, when, how hard, and when
to stop. It's a plain-Markdown doctrine an agent reads and obeys, composed of:

- **The Core** — five non-negotiable [invariants](./mrktn.md#3-the-invariants-immutable-core),
  a [lifecycle model](./mrktn.md#4-the-lifecycle-model) (ideation → scale), and a
  reasoning protocol. Same everywhere.
- **Profiles** — pluggable specializations per product type. ([browse](./profiles))
- **The Instance** — a small living `mrktn.md` in your repo that pins a version,
  picks profile(s), and records your fundamental bets — each with the evidence
  that would reverse it.

### The five invariants
1. **Measurement before money** — no spend you can't attribute to revenue/retention.
2. **Pre-registration** — declare the target *and* the kill criteria before launch.
3. **Sequencing** — retention/PMF gate before scaling acquisition.
4. **Statistical honesty** — never scale on noise; budget proportional to confidence.
5. **Ethics & compliance** — no fabrication, no astroturfing, respect the rules.

A profile may specialize *how* these are met. **None may weaken them.**

## Quickstart

Paste this to your coding agent (Claude Code, Cursor, …) in your repo:

```text
Set up the mrktn.md marketing doctrine in this repo. Read https://mrktn.md/mrktn.md,
read the profile that matches this product, then interview me about the product, its
stage, ICP, and constraints. Scaffold a local mrktn.md, point AGENTS.md at it, and
govern all marketing decisions by its invariants.
```

Or scaffold a starter file:

```bash
curl -fsSL https://mrktn.md/install/mrktn-init.sh | bash
```

On a no-code agent (e.g. Claude Cowork)? [Download the all-in-one file](./mrktn.bundle.md),
drag it into the chat, and say "set up mrktn.md for my product." Full options
(offline, manual, CI, AGENTS.md wiring): [install/INSTALL.md](./install/INSTALL.md).

## Profiles

| id | for |
|---|---|
| [`saas-b2b`](./profiles/saas-b2b.md) | B2B SaaS — sales-assisted or PLG |
| [`saas-b2c`](./profiles/saas-b2c.md) | consumer subscriptions (web & cross-platform) |
| [`mobile-app`](./profiles/mobile-app.md) | native iOS / Android apps (extends saas-b2c) |
| [`ecommerce`](./profiles/ecommerce.md) | DTC / physical goods |
| [`marketplace`](./profiles/marketplace.md) | two-sided marketplaces |
| [`creator-personal-brand`](./profiles/creator-personal-brand.md) | creators & personal brands |

Hybrids compose (e.g. PLG B2B = `saas-b2b` + `saas-b2c`). See
[Composition](./mrktn.md#6-composition).

## Repo structure

```
index.html                   the landing page (served at the mrktn.md root)
mrktn.md                     the Core doctrine (the canonical standard)
profiles/                    pluggable per-type specializations
examples/ledgerly.mrktn.md   a worked local instance
install/                     INSTALL.md · mrktn-init.sh · template.mrktn.md
llms.txt robots.txt sitemap.xml   discoverability for agents & crawlers
og-image.png favicon.svg     social card + icon
LICENSE                      CC BY 4.0
```

## Ethos

I spent twelve years and 100+ products trying to reach the top 1% of growth and
performance marketing. The thing I never made peace with was how *closed* it all
is — the real fundamentals kept behind retainers and NDAs, while builders are
left to cargo-cult tactics and call the survivors geniuses.

`mrktn.md` is the attempt to remove that veil: to put science-, performance-, and
long-term-driven marketing into the open, in a form any agent can follow for
free — while still allowing fast iteration and early wins when the situation
genuinely calls for it. A gift to entrepreneurs everywhere.

It is deliberately **CC BY 4.0**: use it, fork it, ship it inside commercial
products. Just keep attribution.

## Contributing & feedback

This is a living standard, and field reports are the point. The most useful
contributions:

- **New profiles** (`local-services`, `b2b-services`, `infoproduct`, `mobile-game`…).
- **Sharper thresholds** for the I3 retention gate and I4 sample/confidence bars.
- **War stories** — where the doctrine helped, and where it was wrong.

Open an issue or PR. Disagreement that improves the invariants is the highest
form of contribution.

---

*Created and maintained by [Youssef El Ghourfi](https://mrktn.io). Licensed under
[CC BY 4.0](./LICENSE). This project is independent of, and not a commercial
offering of, mrktn.io.*
