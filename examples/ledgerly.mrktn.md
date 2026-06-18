# mrktn.md — Local Instance (worked example)

> Illustrative per-product instance for a fictional company, **Ledgerly**
> (automated month-end close for seed-stage startups). It shows the format from
> §8 of the doctrine in use. Copy [the template](../install/template.mrktn.md)
> into your own repo; keep it short and strategic.

```yaml
extends: mrktn-core@0.2
profile: saas-b2b
also: []
product: Ledgerly
stage: 2-early-traction
last_reviewed: 2026-06-18
```

## Position

We have 38 paying teams and a retained core (M3 logo retention 81% on the last
two cohorts). One acquisition path — founder outreach in two accelerator
communities — works but does not scale. **The single most important thing right
now is finding one repeatable, measurable channel that pays back** before we
spend a cent scaling anything.

## Committed fundamentals

- **Positioning:** "Your month-end close, done by Friday — without a bookkeeper."
  For founders who currently close in spreadsheets and dread it.
- **ICP (one):** seed-stage (post-raise, pre-Series A) US startups, 5–30 staff,
  founder or ops lead owns finance, already on Stripe + a payroll tool.
- **Primary loop:** sales-assisted inbound — useful content on startup finance
  pulls the ICP in; a short founder-led demo converts; expansion as they grow.
- **Constraints:** $6k/mo marketing budget; ~14 months runway; team of 3, no
  dedicated marketer. Sales loop 2–5 weeks → we instrument leading indicators,
  not just closed-won.
- **Definition of success (this stage):** one channel clearing **CAC payback ≤
  12 months at LTV:CAC ≥ 3** on attribution we trust, by end of Q3.

## Ruled out / anti-goals

- **Paid social (Meta/TikTok)** — wrong intent for a considered B2B finance
  purchase; would import B2C scale tactics (profile anti-pattern).
- **Conferences/sponsorships** — unmeasurable at our budget (fails I1).
- **Broadening past seed-stage** — every "what about agencies/SMBs?" detour has
  diluted message-market fit. One ICP until we graduate.

## Marketing Decision Record

```yaml
- date: 2026-04-02
  decision: Make high-intent Google Search (terms like "startup month end close")
            our ONE paid bet for the channel test.
  stage: 2-early-traction
  rationale: ICP searches with intent; small, measurable, attributable spend —
             satisfies I1 with demo-booked events, not platform ROAS.
  expected_outcome:
    metric: CAC payback on closed-won from this channel
    target: <= 12 months at LTV:CAC >= 3
    box: $3k over 8 weeks
  reversal_condition: CAC payback > 18 months after 8 weeks AND >= 20 demos
                      booked (enough to judge); or cost-per-demo stays > $150.
  status: open

- date: 2026-03-10
  decision: Do NOT scale the accelerator-community outreach with paid amplification.
  stage: 2-early-traction
  rationale: I3 gate — retention is healthy (81% M3), so the bucket isn't leaky,
             but the channel is inherently unscalable and unattributable; paying
             to amplify it would buy unmeasurable volume (fails I1).
  expected_outcome:
    metric: n/a — refusal-to-spend decision
    target: keep outreach as a manual loop only
    box: $0
  reversal_condition: we find a measurable way to attribute community-sourced
                      signups (e.g. dedicated landing + code).
  status: confirmed

- date: 2026-01-22
  decision: Killed the LinkedIn Ads test.
  stage: 2-early-traction
  rationale: Pre-registered $2k/6wk test (I2). At week 6 — 9 demos, 1 closed.
             n far too small to call a CAC honestly (I4) AND the point estimate
             implied ~30-month payback, well past target.
  expected_outcome:
    metric: CAC payback
    target: <= 12 months
    box: $2k over 6 weeks
  reversal_condition: revisit only at Stage 3 with a proven offer and budget to
                      reach significance.
  status: reversed
```

## Open experiments (pre-registered, awaiting resolution)

```yaml
- hypothesis: A weekly "Close Checklist" lead magnet converts inbound readers to
              demos at a rate that makes content a viable Stage-2 channel.
  primary_metric: reader -> demo-booked rate
  target: >= 3% of downloads book a demo within 14 days
  box: 6 published pieces + magnet over 10 weeks; $0 paid (organic test)
  kill_criteria: < 1% after 1,000 downloads, OR demos don't reach pipeline
  status: running (week 3)
```

---

*Notice what this file does and doesn't contain. No live campaign settings, no
daily metrics — those live in the ad tools and in analytics. This file holds only
the fundamental bets and the reasoning behind them, each with the evidence that
would reverse it. That is the entire point.*
