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
