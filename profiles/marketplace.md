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
