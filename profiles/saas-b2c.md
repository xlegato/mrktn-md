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
measurement** (geo holdouts, on/off tests) and trust your cohort retention. A
dedicated `mobile-app` profile that `extends: saas-b2c` is on the roadmap;
until then, override ASO/attribution specifics in your instance.
