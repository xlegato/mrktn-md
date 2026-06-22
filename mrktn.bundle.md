<!-- mrktn.bundle.md — the entire mrktn.md standard in ONE file.
     For no-code agents (e.g. Claude Cowork) that can't fetch URLs:
     drag this file into the chat and say —
     "Set up the mrktn.md marketing doctrine for my product from this file."
     Doctrine + all profiles + the instance template are all below. CC BY 4.0. -->

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

===================================================================

# PROFILES (all included — use the one matching your product)


<!-- ===== profile: saas-b2b ===== -->

# Profile: `saas-b2b`

> B2B SaaS — sales-assisted, PLG, or both. Long-ish loops, small n, expansion
> revenue. Specializes [mrktn-core](../mrktn.md). Never weakens I1–I5.

```yaml
id: saas-b2b
extends: null
primary_loop: >
  sales-assisted acquisition + content/inbound, compounded by expansion revenue
  (land small, grow seats/usage)
default_channels:
  stage0: problem interviews, founder communities, cold outreach
  stage1: founder-led sales, warm intros, niche communities
  stage2: outbound + ONE inbound bet (content/SEO or high-intent paid search)
  stage3: scale the proven motion; add partnerships / ABM / co-marketing
  stage4: category & brand, partner ecosystem, expansion (NRR) motion
benchmarks:
  retention_floor: logo retention healthy + net revenue retention >= 100%
  payback_bar: CAC payback <= 12 months (tighter for SMB, looser for enterprise)
primary_metric: pipeline -> closed-won payback; net revenue retention (NRR)
payback_target: CAC payback <= 12 months; LTV:CAC >= 3
feedback_loop: slow (weeks to quarters) — instrument LEADING indicators
key_constraints: >
  small n (few deals) makes statistical honesty hard; long cycles delay learning
invariant_notes:
  I1: attribute to pipeline/closed-won (demo booked, opp created), never to MQLs
      or in-platform metrics
  I3: "retention" = logo retention + NRR; do not scale spend before the sales
      motion is repeatable AND accounts expand rather than churn
  I4: with small n, lean on leading indicators + qualitative signal, not p-values
      on 11 conversions
anti_patterns:
  - importing B2C paid-social scale tactics
  - celebrating vanity MQLs that never reach pipeline
  - scaling spend before the sales process is repeatable
  - buying a logo wall instead of references that close deals
```

## Notes

The defining constraint of B2B is **slow, small-n feedback**. You cannot A/B your
way to truth on 8 deals a quarter, so the discipline shifts up-funnel: measure
leading indicators (qualified opportunities, demo→close rate, sales-cycle length)
and treat closed-won payback as the lagging confirmation.

PLG B2B (self-serve trials feeding sales) is a **hybrid** — compose with
`saas-b2c` (`also: [saas-b2c]`) to inherit activation/retention instrumentation
for the self-serve motion while keeping B2B payback discipline on the sales-led
expansion.


<!-- ===== profile: saas-b2c ===== -->

# Profile: `saas-b2c`

> Consumer apps & subscriptions. Fast loops, fickle attention, churn is the
> enemy. Specializes [mrktn-core](../mrktn.md). Never weakens I1–I5.

```yaml
id: saas-b2c
extends: null
primary_loop: >
  acquisition -> activation -> habit -> subscription, amplified by referral /
  word-of-mouth loops where the product allows
default_channels:
  stage0: communities, audience building, waitlist, organic content
  stage1: organic social/content + manual; instrument D1/D7/D30 retention
  stage2: ONE paid channel test (paid social or search) + one organic loop
  stage3: scale paid within payback; referral/virality loops; lifecycle/CRM
  stage4: brand, multi-channel, pricing/packaging, win-back & resurrection
benchmarks:
  retention_floor: a flattening retention curve (D30 stabilizes, not -> 0)
  payback_bar: CAC payback <= 6 months (consumers churn faster than B2B)
primary_metric: trial->paid conversion; subscription retention (logo + revenue)
payback_target: CAC payback <= 6 months; LTV:CAC >= 3; watch monthly churn
feedback_loop: fast (days) — real experiments are achievable; use I4 honestly
key_constraints: >
  high churn risk, attention is fickle, heavy platform dependency, mobile
  attribution is lossy (SKAN/consent) if there's an app
invariant_notes:
  I1: define a measurable activation event; with lossy mobile attribution, lean
      on holdouts/geo-tests and cohort retention, not in-platform ROAS
  I3: the retention curve MUST flatten before scaling acquisition — a consumer
      leaky bucket empties fast
  I4: fast loops tempt over-reading daily noise; hold to sample thresholds
anti_patterns:
  - celebrating downloads/sign-ups without activation
  - discount-driven growth that destroys LTV
  - chasing virality before retention exists (I3)
  - optimizing installs instead of retained, paying users
```

## Notes

B2C lives and dies on **retention and the speed of the loop**. The good news:
fast feedback makes real experimentation possible, so I4 is achievable rather
than aspirational. The trap: that same speed seduces teams into reading daily
noise as signal.

If there's a native mobile app, attribution is structurally lossy
(SKAN/ATT/consent). Don't fight it with platform ROAS — design for **incremental
measurement** (geo holdouts, on/off tests) and trust your cohort retention. If
you ship a native app, use the [`mobile-app`](./mobile-app.md) profile — it
`extends` this one and overrides the store, attribution, and fee specifics.


<!-- ===== profile: mobile-app ===== -->

# Profile: `mobile-app`

> Native iOS / Android apps. `extends:` [`saas-b2c`](./saas-b2c.md) — it inherits
> the consumer retention-curve discipline and overrides what's genuinely
> different about apps: **attribution, distribution, fees, and re-engagement.**
> Specializes [mrktn-core](../mrktn.md). Never weakens I1–I5.

```yaml
id: mobile-app
extends: saas-b2c
primary_loop: >
  store + paid-UA acquisition -> install -> activation (first session) -> habit
  -> subscription/IAP, amplified by push/lifecycle re-engagement and ratings
default_channels:
  stage0: communities, pre-launch waitlist/landing, audience building
  stage1: ASO foundations + organic/manual; instrument install->activation->D1/D7/D30
  stage2: ONE paid-UA test (Apple Search Ads / Google UAC / Meta) + ASO; MMP attribution
  stage3: scale UA within payback; add ad networks (AppLovin/ironSource); push & lifecycle loops
  stage4: brand, multi-network portfolio, creative pipeline, IAP/subscription pricing, win-back
benchmarks:
  retention_floor: D30 retention flattening above category baseline; healthy store rating
  payback_bar: CAC payback <= 6 months NET of the 15-30% store fee
primary_metric: install->activation->paying conversion; D1/D7/D30 retention; cohort ROAS via MMP
payback_target: CAC payback <= 6 months net of store fee; LTV:CAC >= 3
feedback_loop: fast on creative/UA; SLOW + LOSSY on attribution (SKAN windows, ATT opt-out)
key_constraints: >
  privacy-driven attribution loss (Apple SKAN/ATT, Google Privacy Sandbox); app-store
  gatekeepers & review; 15-30% platform fee on IAP; an install is not a user;
  rating/ranking algorithm dependency
invariant_notes:
  I1: attribution is structurally lossy — do NOT trust deterministic last-touch; measure
      with SKAN + MMP cohorts + incrementality (geo/holdout) tests, never raw in-platform ROAS
  I3: "retention" = activation, then the D7/D30 curve flattening; an install is not a user —
      do not scale UA until the post-install curve holds
  I4: UA creative throughput is high while SKAN data is delayed, aggregated, and noisy —
      respect attribution windows and sample size before declaring winners or scaling
anti_patterns:
  - optimizing installs (CPI) instead of activated, retained, paying users
  - trusting deterministic attribution in a SKAN/ATT world
  - ignoring the 15-30% store fee when computing payback and LTV
  - buying installs from incentivized networks that never activate
  - neglecting ASO — the one channel with compounding, near-zero marginal cost and real intent
```

## What it overrides (and why apps are different)

This profile inherits everything from `saas-b2c` — the loop shape, the
retention-first sequencing, the churn sensitivity — and changes four things that
web consumer products don't face:

**1. Attribution is lossy by design.** Post-ATT, deterministic user-level
attribution is gone on iOS; SKAN gives you delayed, aggregated, privacy-capped
signal. The doctrine's answer (I1) gets sharper, not softer: grade on **MMP
cohorts + incrementality tests (geo/holdout)**, never on the network's
self-reported ROAS. Treat install-time attribution as a hint, retention cohorts
as the truth.

**2. Distribution runs through gatekeepers.** Apple and Google control discovery,
review, and ranking. **ASO** is therefore a first-class channel — compounding,
near-zero marginal cost, and the only one carrying genuine store intent. It
belongs in Stage 1, before paid UA.

**3. The store takes 15–30%.** Every LTV and payback figure must be computed
**net of platform fees**, or the unit economics are a fiction.

**4. Re-engagement is a built-in loop.** Push, in-app messaging, and lifecycle
campaigns are owned, measurable retention levers — the app equivalent of email,
and a core part of making the D7/D30 curve hold before you scale acquisition.

> Use `mobile-app` as your primary profile if the app store is your main
> distribution. If you're cross-platform with a strong web motion, compose:
> `profile: mobile-app` + `also: [saas-b2c]` keeps both lenses active.


<!-- ===== profile: ecommerce ===== -->

# Profile: `ecommerce`

> DTC / physical goods. Margin is the master. Platform ROAS lies. Specializes
> [mrktn-core](../mrktn.md). Never weakens I1–I5.

```yaml
id: ecommerce
extends: null
primary_loop: >
  paid + organic acquisition -> first purchase -> repeat/AOV/retention via
  email & SMS; economics governed by contribution margin
default_channels:
  stage0: validate demand (pre-orders, landing tests, small drops)
  stage1: founder/organic + small paid test; nail offer, creative, and PDP
  stage2: paid social + search test; margin-based attribution; email/SMS flows
  stage3: scale paid within contribution margin; creative volume; retention/subscription
  stage4: omni-channel, brand, retail/wholesale, LTV expansion
benchmarks:
  retention_floor: a measurable repeat-purchase rate (category-dependent)
  payback_bar: first order contribution-positive, or payback <= 90 days
primary_metric: contribution margin after CAC (NOT platform ROAS); repeat rate
payback_target: first-order profitable or <= 90-day payback; MER set by margin
feedback_loop: fast — creative is the lever; high experiment throughput
key_constraints: >
  post-iOS platform ROAS overstates results; inventory & cash-flow limits;
  thin margins punish bad CAC; creative fatigue is constant
invariant_notes:
  I1: measure blended/contribution-margin economics (MER, new-customer CAC),
      never in-platform ROAS in isolation
  I3: "retention" = repeat purchase; a one-and-done catalog can't be scaled
      profitably no matter the ad budget
  I4: high creative throughput means lots of false winners — respect sample size
      before scaling a "hero" creative
anti_patterns:
  - optimizing in-platform ROAS instead of contribution margin
  - discounting into the ground to hit revenue targets
  - scaling a money-losing first order with no retention plan
  - ignoring cash-flow/inventory constraints when scaling spend
```

## Notes

The single biggest error in e-commerce is **trusting the number the ad platform
reports about itself**. Post-iOS, in-platform ROAS systematically overstates.
The doctrine's answer is blunt: grade on **contribution margin after CAC** and
blended efficiency (MER), confirmed against actual orders.

Creative is the dominant lever and throughput is high — which is exactly why I4
matters most here. A creative that "wins" on 40 conversions is usually noise.
Scale on margin, confirmed over enough volume to mean something.


<!-- ===== profile: marketplace ===== -->

# Profile: `marketplace`

> Two-sided marketplaces. Cold-start is the whole game. Liquidity beats GMV.
> Specializes [mrktn-core](../mrktn.md). Never weakens I1–I5.

```yaml
id: marketplace
extends: null
primary_loop: >
  solve the constrained side first -> reach local liquidity -> the liquidity
  loop (supply attracts demand attracts supply) compounds within a beachhead
default_channels:
  stage0: identify the constrained side; manually recruit it; pick ONE beachhead
  stage1: hand-build supply (do things that don't scale); seed demand manually
  stage2: find a repeatable channel for the constrained side; grow density in one beachhead
  stage3: replicate the beachhead playbook to new geos/categories
  stage4: network effects/defensibility, take-rate optimization, cross-side expansion
benchmarks:
  retention_floor: constrained-side retention + rising match/fill rate
  payback_bar: payback measured on the side you pay to acquire
primary_metric: liquidity (match rate / fill rate / search-to-fill); GMV is derived
payback_target: per-side CAC vs. contribution on that side; loop must compound locally
feedback_loop: medium — geographic/category experiments; two-sided attribution is tricky
key_constraints: >
  chicken-and-egg cold start; local network effects mean global metrics mislead;
  leakage/disintermediation; balancing the two sides
invariant_notes:
  I1: measure liquidity, not vanity GMV; attribute per side
  I3: "retention" = the constrained side staying AND transactions clearing; don't
      pour demand onto thin supply (or vice versa)
  I4: judge liquidity within a beachhead; aggregate national numbers hide
      per-market truth
anti_patterns:
  - spending on both sides equally instead of the constrained one
  - scaling demand past available supply (or vice versa)
  - national launch before one market has liquidity
  - reporting GMV growth while match/fill rate stays broken
```

## Notes

A marketplace is not one product; it's **two audiences and the liquidity between
them**. Almost every marketplace failure is a cold-start failure dressed up as a
marketing problem. The doctrine forces the right sequence: identify the
**constrained side**, win **one beachhead** to genuine liquidity, *then* find a
repeatable channel — and only then replicate.

Global metrics are actively misleading here because network effects are local. A
healthy city and three dead ones can average to "growth." Judge everything at the
beachhead level, and treat **liquidity** (match/fill rate, time-to-fill), not
GMV, as the metric that tells the truth.


<!-- ===== profile: creator-personal-brand ===== -->

# Profile: `creator-personal-brand`

> Creators, audiences, personal brands. Content is the factory; trust is the
> currency; owned audience is the asset. Specializes [mrktn-core](../mrktn.md).
> Never weakens I1–I5.

```yaml
id: creator-personal-brand
extends: null
primary_loop: >
  content -> reach -> trust -> owned audience -> monetization (products,
  sponsorships, services); compounds via back-catalog + platform distribution
default_channels:
  stage0: pick ONE platform + ONE niche/POV; test formats; check resonance
  stage1: consistent publishing on one platform; convert reach -> owned list
  stage2: find the content loop that grows reach AND the owned channel; first monetization test
  stage3: scale what works; repurpose across platforms; build free->paid funnel
  stage4: brand, systematize content & team, multiple revenue lines, IP/defensibility
benchmarks:
  retention_floor: owned-audience growth + engagement that doesn't decay to zero
  payback_bar: for paid promo, payback via product/list value; time is the budget
primary_metric: owned-audience growth (email/list) + engaged reach; revenue per subscriber
payback_target: monetization yield per 1k engaged audience; treat TIME like budget
feedback_loop: fast (per post) but high-variance — algorithmic distribution is noisy
key_constraints: >
  platform/algorithm dependency, consistency/burnout, attributing trust->sale,
  the seduction of vanity follower counts
invariant_notes:
  I1: measure owned-audience growth and revenue, not follower vanity; a viral
      post with no list growth or sales is unmeasured noise
  I3: the retention analog is TRUST — build audience trust before monetizing;
      monetizing a cold audience is the creator's leaky bucket
  I4: one viral post is not a repeatable strategy; judge formats over many posts,
      not a single hit (survivorship bias is acute here)
anti_patterns:
  - chasing follower count over an owned audience you control
  - going wide across platforms before one format/platform works
  - monetizing before trust exists (I3 analog)
  - buying followers/engagement (I5) — fake audience, real account risk
```

## Notes

For a creator, the **retention gate (I3) becomes a trust gate**: an audience that
doesn't trust you yet is exactly a leaky bucket, and monetizing it early burns
the asset. Build trust first; monetize the trust.

Distribution here is algorithmic and high-variance, which makes I4 — statistical
honesty — unusually important. One post that pops is the creator's version of
"winning the lottery and feeling like a genius." Judge a *format* across many
posts, and treat **time** as the scarce budget: apply the same explore/exploit
discipline to your hours that a paid marketer applies to dollars.

The durable asset is the **owned audience** (email/list) — the one channel no
algorithm can take from you. Every stage optimizes toward owning more of it.


===================================================================

<!-- ===== instance template ===== -->

# mrktn.md — <PRODUCT> (local instance)

<!--
This is your product's living marketing doctrine. Keep it SHORT and STRATEGIC.
It holds fundamental bets and the reasoning behind them — not live campaigns
(those live in your ad tools) and not raw metrics (those live in analytics).
Doctrine: https://mrktn.md   Profiles: ../profiles
-->

```yaml
extends: mrktn-core@0.2
profile: <profile>            # saas-b2b | saas-b2c | mobile-app | ecommerce | marketplace | creator-personal-brand
also: []                      # optional secondary profiles for hybrids
product: <PRODUCT>
stage: 0-ideation             # 0-ideation | 1-pre-pmf | 2-early-traction | 3-growth | 4-scale
last_reviewed: <YYYY-MM-DD>
```

## Position

<!-- One paragraph: where the product is, and the single most important thing right now. -->

## Committed fundamentals

- **Positioning:** <!-- who it's for + the one promise -->
- **ICP (one):** <!-- resist plural ICPs until you graduate stages -->
- **Primary loop:** <!-- the dominant growth mechanic; see your profile -->
- **Constraints:** <!-- budget / runway / team / feedback-loop length -->
- **Definition of success (this stage):** <!-- the bar that graduates you -->

## Ruled out / anti-goals

<!-- What you are explicitly NOT doing, each with a one-line why. As important as what you choose. -->
-

## Marketing Decision Record

<!-- Append one entry per fundamental decision. The reversal_condition is mandatory: it makes the decision falsifiable. -->
```yaml
- date: <YYYY-MM-DD>
  decision:
  stage:
  rationale:
  expected_outcome:
    metric:
    target:
    box:                      # spend/time box
  reversal_condition:         # the evidence that would flip this
  status: open                # open | confirmed | reversed
```

## Open experiments

<!-- Pre-registered (I2), awaiting resolution. -->
```yaml
- hypothesis:
  primary_metric:
  target:
  box:
  kill_criteria:
  status:
```
