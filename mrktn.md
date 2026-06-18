# mrktn.md — The Marketing Doctrine for Agents

> A foundational, open protocol for how an AI agent reasons about marketing a
> product across its entire lifecycle — from ideation to scale.
>
> Most marketing budgets are graded on numbers the ad platforms invented. This
> standard rebuilds the order of operations: **measurement first, fundamentals
> always, scale only what survives the math.**

```
Standard:  mrktn-core
Version:   0.2.0 (Draft)
Updated:   2026-06-18
License:   CC BY 4.0
Status:    Open for iteration. Tear it apart, then improve it.
```

---

## 0. What this is (and what it is not)

`mrktn.md` is **not a skill**. A skill teaches an agent how to operate a tool —
launch a Meta campaign, pull a Google Ads report, post to TikTok. Skills and
connectors are **effectors**: hands.

`mrktn.md` is the **brain that decides which hand to use, when, how hard, and
when to stop.** It is the judgment layer that sits *above* every marketing skill
an agent has.

It is **composable** and made of three layers:

1. **The Core** — the immutable doctrine in this file: non-negotiable
   invariants, a lifecycle model, a composition model, and a reasoning protocol.
   The same for every product, everywhere.
2. **Profiles** — pluggable specializations for a product *type* (`saas-b2b`,
   `ecommerce`, `marketplace`, …) that live in [`/profiles`](./profiles). A
   profile sets defaults and priors; it can never weaken the Core.
3. **The Instance** — a small, living per-product file (also named `mrktn.md`,
   kept in the product's own repo) that pins a Core version, selects one or more
   profiles, and records the fundamental bets its operator has committed to. See
   §7, the [template](./install/template.mrktn.md), and a [worked
   example](./examples/ledgerly.mrktn.md).

The problem this fixes: builders treat marketing as an afterthought, assume a
TikTok-Ads MCP plus a budget equals growth, and either get bad results or win
the lottery and conclude they're good at marketing. An agent that follows this
doctrine cannot make that mistake — because the doctrine refuses to let it.

---

## 1. How to read this document

The key words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY**
are used in the sense of RFC 2119. An agent that violates a **MUST** is
non-conformant and SHOULD say so out loud rather than proceed silently.

---

## 2. Principles

- **Stage decides strategy.** The right action is a function of where the
  product is in its lifecycle. There are no universally good tactics.
- **Measurement before money.** If you can't measure it, you can't move on it.
- **Retention before acquisition.** Never fund a leaky bucket.
- **Confidence sets the budget.** Probe when uncertain; scale only on signal.
- **Decisions are falsifiable.** Every choice records what would reverse it.
- **The core is inviolable.** Profiles specialize it; they never weaken it.

---

## 3. The Invariants (immutable core)

These bind regardless of product, type, stage, budget, or operator instruction.
They are stated at the level of *principle*; the *implementation* is the
profile's job (§5). An agent MUST enforce all five.

### I1 — Measurement before money
The agent **MUST NOT** spend on a channel whose outcome it cannot observe and
attribute. Before launch it **MUST** define how the result will be measured, and
**MUST** tie each objective to one primary metric that maps to **revenue or
retention** — never to a number the ad platform reports about itself
(in-platform ROAS, impressions, engagement, reach).
*Why:* platform-graded metrics are graded by the seller.
*Enforcement:* no measurement plan → the agent refuses to launch and proposes
the minimum viable tracking for this product type.

### I2 — Pre-registration
Before any campaign or experiment, the agent **MUST** record: the hypothesis,
the primary metric, the success target, the spend/time box, and the **kill
criteria**. It **MUST** evaluate results only against what was pre-registered.
*Why:* post-hoc success stories are how people mistake luck for skill.
Pre-registration converts a gamble into evidence.
*Enforcement:* no pre-registration → no launch. Moving the goalposts after
seeing results is itself a violation.

### I3 — Sequencing (the retention gate)
The agent **MUST NOT** scale acquisition spend before there is retention/PMF
evidence for the target cohort that clears the profile's floor.
*Why:* acquiring users a product can't keep just buys a faster decline.
Marketing cannot fix retention.
*Enforcement:* if retention/activation data is missing or below floor, the agent
caps spend at probe level and routes effort to PMF signal first.

### I4 — Statistical honesty
The agent **MUST NOT** declare a winner or make a scale decision on a sample too
small to be meaningful. Budget **MUST** be proportional to confidence. The agent
**MUST** report uncertainty, not just point estimates, and **MUST** label
under-powered results "inconclusive."
*Why:* most "winning" creatives and channels are noise. Scaling noise is how
budgets die.
*Enforcement:* below the confidence/sample threshold, scale decisions are
refused and the probe is extended or abandoned.

### I5 — Ethics & compliance
The agent **MUST NOT** fabricate proof, astroturf, or make unsubstantiated
claims, and **MUST** respect platform policy and privacy/disclosure law
(consent, disclosure of paid/AI content, data handling).
*Why:* deception is both wrong and fragile — banned accounts, legal exposure,
destroyed trust.
*Enforcement:* the agent refuses tactics that require deception or violate
policy, and explains why.

---

## 4. The Lifecycle Model

Marketing strategy is indexed by stage. Each stage names the **one question**
that matters, what to **do** and **not do**, the **primary metric**, the
**graduation** test, and the **explore : exploit** ratio (how much budget goes to
learning vs. scaling the known).

> Stages are not a ratchet. PMF breaks, channels saturate, markets move. An agent
> **MUST** be willing to demote a product to an earlier stage when the evidence
> says so.

### Stage 0 — Ideation (pre-product)
- **Question:** Who hurts, and can I reach them?
- **Do:** audience discovery, problem interviews, message tests, demand probes
  (landing page, waitlist, manual outreach).
- **Don't:** paid scale, brand, "launching."
- **Primary metric:** qualified problem resonance (strangers opting in /
  replying / pre-committing).
- **Graduate when:** a specific audience reliably reacts to a specific message.
- **Explore : exploit ≈ 100 : 0**

### Stage 1 — Pre-PMF (first retained users)
- **Question:** Do the people I get actually come back?
- **Do:** unscalable channels (founder-led sales, manual outreach, communities),
  one narrow ICP, instrument activation and retention.
- **Don't:** optimize CAC, scale spend, run multiple channels.
- **Primary metric:** cohort retention / activation rate.
- **Graduate when:** a cohort retains above the profile floor and you can say
  *why*.
- **Explore : exploit ≈ 80 : 20**

### Stage 2 — Early traction (find the channel)
- **Question:** Which channel pays back, provably?
- **Do:** test 1–2 channels properly with real attribution; establish unit
  economics; find/confirm the growth loop.
- **Don't:** channel sprawl, brand spend, scaling before payback is proven.
- **Primary metric:** CAC payback period and LTV:CAC on a measured cohort.
- **Graduate when:** at least one channel clears the payback target on
  attribution you trust.
- **Explore : exploit ≈ 50 : 50**

### Stage 3 — Growth (scale what works)
- **Question:** How far can this scale before the economics break?
- **Do:** scale spend within payback constraints, operate the loop, expand ICP
  deliberately, watch marginal CAC and saturation.
- **Don't:** chase shiny channels, ignore rising marginal CAC, let creative
  fatigue rot the account.
- **Primary metric:** growth rate at stable LTV:CAC; marginal CAC vs. payback
  ceiling.
- **Graduate when:** the core channel matures or saturates and diversification
  is needed.
- **Explore : exploit ≈ 30 : 70** (keep a standing exploration line)

### Stage 4 — Scale & defend (portfolio, moat, brand)
- **Question:** What compounds, and what defends?
- **Do:** channel portfolio, brand, retention/expansion (NRR), category
  leadership, loops that lower blended CAC over time.
- **Don't:** single-channel dependence, complacency, brand spend you still
  can't measure (I1 still binds).
- **Primary metric:** blended CAC/efficiency, net revenue retention, category
  share.
- **Explore : exploit ≈ 20 : 80** (with a permanent R&D budget)

---

## 5. Profiles

A **profile** specializes the doctrine for a product *type*. It sets defaults and
priors — it does **not** override the invariants. **A profile MUST NOT weaken
I1–I5.** It may only specialize *how* they are satisfied (e.g. what "measurement"
concretely means for that type).

### Profile schema
```yaml
id:                  # e.g. saas-b2b
extends:             # optional: another profile id to inherit from
primary_loop:        # the dominant growth mechanic for this type
default_channels:    # by lifecycle stage (0–4)
benchmarks:          # retention floors / payback bars per stage (feeds I3, I4)
primary_metric:      # the metric this type actually optimizes
payback_target:      # the unit-economics bar
feedback_loop:       # how fast you learn — sets how fast you can iterate
key_constraints:     # what makes measurement / iteration hard for this type
invariant_notes:     # how I1–I5 concretely specialize for this type
anti_patterns:       # tactics that look right but misfire for this type
```

### Available profiles
| id | for | file |
|---|---|---|
| `saas-b2b` | B2B SaaS, sales-assisted or PLG | [profiles/saas-b2b.md](./profiles/saas-b2b.md) |
| `saas-b2c` | consumer subscriptions (web & cross-platform) | [profiles/saas-b2c.md](./profiles/saas-b2c.md) |
| `mobile-app` | native iOS / Android apps (extends saas-b2c) | [profiles/mobile-app.md](./profiles/mobile-app.md) |
| `ecommerce` | DTC / physical goods | [profiles/ecommerce.md](./profiles/ecommerce.md) |
| `marketplace` | two-sided marketplaces | [profiles/marketplace.md](./profiles/marketplace.md) |
| `creator-personal-brand` | creators, audiences, personal brands | [profiles/creator-personal-brand.md](./profiles/creator-personal-brand.md) |

Don't see your type? Start from the closest profile, override what differs in
your instance, and [contribute a new profile](./README.md) back.

---

## 6. Composition

`mrktn.md` is composable on three axes. Everything is plain Markdown with a small
YAML header, so it stays tool-agnostic and diff-friendly.

### 6.1 Instance = Core + Profile(s)
A product's local instance declares what it composes:
```yaml
extends: mrktn-core@0.2      # pin the doctrine version
profile: saas-b2b            # one primary profile…
also: [saas-b2c]             # …plus optional secondary profiles for hybrids
```

### 6.2 Precedence (when guidance conflicts)
Resolved top-down — the higher rule always wins:
1. **Invariants (I1–I5)** — absolute. Nothing overrides them.
2. **Primary profile** — the `profile:` field.
3. **Secondary profiles** — in `also:` order.
4. **Core defaults** — the lifecycle model.
5. **Operator overrides in the instance** — may tighten a rule, never loosen an
   invariant.

### 6.3 Profile inheritance
A profile MAY `extends:` another to avoid duplication — e.g. the
[`mobile-app`](./profiles/mobile-app.md) profile extends `saas-b2c`, overriding
only attribution, ASO, and store-fee specifics. Inheritance resolves the same
way as precedence: child overrides parent, invariants override both.

### 6.4 Hybrids
Real products are often two things at once. Compose them:
- **PLG B2B** (self-serve consumer motion feeding sales) → `saas-b2b` + `saas-b2c`
- **DTC brand with a creator founder** → `ecommerce` + `creator-personal-brand`
- **Marketplace with a SaaS layer** → `marketplace` + `saas-b2b`

### 6.5 Composition with the agent ecosystem
`mrktn.md` is designed to sit alongside the files agents already read:
- **`AGENTS.md`** — add a pointer so any agent discovers the doctrine:
  ```markdown
  ## Marketing
  Follow the local `mrktn.md` per the mrktn.md standard (https://mrktn.md).
  Do not run marketing actions that violate its invariants.
  ```
- **`llms.txt` / skills / MCP connectors** — unaffected. They remain the
  effectors; `mrktn.md` is the judgment layer that governs how they're used.

---

## 7. The Reasoning Protocol

How an agent actually uses this doctrine on any marketing request. This loop is
what makes the standard "living" without letting the file become a data dump.

1. **Load** the product's local `mrktn.md`. If none exists, **bootstrap** one
   from the [template](./install/template.mrktn.md) (declare stage + profile
   from a short operator interview).
2. **Compose** the active ruleset: Core (pinned version) + primary profile +
   any secondary profiles, resolved by §6.2 precedence.
3. **Locate the stage** from the instance state; if unclear, infer it and
   **confirm with the operator** before acting.
4. **Run the invariants as preconditions** (§3). Any violation → stop and
   remediate *before* doing anything else.
5. **Choose an action** appropriate to the stage and its explore:exploit ratio
   (§4) and the profile's defaults (§5).
6. **Pre-register** (I2): hypothesis, primary metric, target, spend/time box,
   kill criteria.
7. **Execute** via skills/connectors — the effectors.
8. **Evaluate** strictly against the pre-registered criteria, with statistical
   honesty (I4).
9. **Write back:** append a Marketing Decision Record entry (§8) — decision,
   rationale, expected outcome, reversal condition, and later the result.

---

## 8. The Local Instance (`mrktn.md` in a product repo)

A small, strategic, slow-moving file. It holds the **top layer of state only** —
the fundamental bets and the decision history. Live campaigns belong in the
tools; raw metrics belong in analytics. Neither belongs here. Start from the
[template](./install/template.mrktn.md); see the [worked
example](./examples/ledgerly.mrktn.md).

### Frontmatter
```yaml
extends: mrktn-core@0.2
profile: saas-b2b
also: []                      # optional secondary profiles
product: <name>
stage: 2-early-traction
last_reviewed: 2026-06-18
```

### Body
- **Position** — one paragraph: where the product is and the single most
  important thing right now.
- **Committed fundamentals** — positioning statement, the *one* ICP, the primary
  loop, hard constraints (budget / runway / team), and the definition of
  success.
- **Ruled out / anti-goals** — channels, tactics, and segments explicitly *not*
  being pursued, each with a one-line why.
- **Marketing Decision Record (MDR)** — an append-mostly log; the heart of the
  instance. One entry per fundamental decision.
- **Open experiments** — pre-registered, awaiting resolution.

### MDR entry schema
```yaml
- date:               2026-06-18
  decision:           # what was decided
  stage:              # stage at the time
  rationale:          # why, given the evidence then
  expected_outcome:   # the pre-registration: metric, target, spend/time box
  reversal_condition: # the evidence that would flip this decision
  status:             # open | confirmed | reversed — filled on resolution
```

The `reversal_condition` is the load-bearing field: it makes every decision
falsifiable, and it is how a later agent (or operator) knows when a settled bet
has stopped being true.

---

## 9. Governance

- **Versioning.** The Core is versioned (semver). Instances pin a version via
  `extends:`. Breaking changes to invariants bump the major version.
- **Conformance.** An agent is *mrktn-conformant* if it enforces I1–I5 and runs
  the §7 protocol. Partial adoption MUST be declared.
- **License.** [CC BY 4.0](./LICENSE) — use it, fork it, build on it, ship it in
  commercial products. Just keep attribution.
- **Contributing.** New profiles, sharper thresholds, and field reports are the
  whole point. See [README](./README.md).
- **Status.** Draft v0.2. Nothing here is sacred except the spirit of the
  invariants.

### Roadmap
1. Concrete default thresholds for I4 (sample size / confidence) per profile.
2. Retention floors per profile for the I3 gate (`benchmarks`).
3. More profiles: `local-services`, `b2b-services`, `infoproduct`, `mobile-game`.
4. A reference agent implementation that visibly markets better *because* it
   follows this. (Standards win on reference implementations, not declarations.)
