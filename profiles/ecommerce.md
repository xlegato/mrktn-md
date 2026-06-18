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
