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
