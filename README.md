# Harvv — Google Tag Manager Template

Behavioral UX analytics pixel for Google Tag Manager.

Detects dead clicks, rage clicks, hesitation, scroll problems, and JS errors automatically. Under 3.5KB gzipped, zero PII collected.

## Setup

1. In GTM, go to **Templates** → **Search Gallery** → search "Harvv"
2. Add the template
3. Create a new tag using the Harvv template
4. Enter your **Pixel Key** (from [harvv.com](https://harvv.com) dashboard)
5. Set trigger to **All Pages**
6. Publish

## What it tracks

| Signal | Description |
|--------|-------------|
| Dead clicks | Clicks on non-interactive elements |
| Rage clicks | 3+ clicks in 800ms within 50px |
| Hesitation | 500ms+ hover on interactive elements |
| Scroll depth | 25/50/75/100% milestones |
| JS errors | Uncaught errors + unhandled rejections |
| Performance | TTFB, LCP, CLS |
| Navigation | In-session page changes (SPA support) |
| Conversions | Auto-detected on thank-you/confirmation pages |

## Privacy

- Zero personal data collected
- No form values, text content, or keystrokes (except Tab/Escape)
- First-party cookies only
- 3.5KB gzipped — smaller than a product thumbnail

## Links

- [Harvv Dashboard](https://harvv.com)
- [Documentation](https://harvv.com/#/for/websites)

## License

Apache 2.0
