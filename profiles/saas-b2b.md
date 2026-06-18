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
