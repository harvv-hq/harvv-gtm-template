# Harvv — Google Tag Manager Template

Behavioral UX analytics pixel for Google Tag Manager.

Detects dead clicks, rage clicks, hesitation, scroll problems, and JS errors automatically. One async script, about 43 KB gzipped.

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

Harvv does not collect names, emails or anything visitors type, and it does not record sessions. It uses first-party cookies with a random visitor ID, so list it in your privacy policy and your consent banner where your visitors' law requires one.

- No form values or typed text
- No session recordings
- Fire this tag only after consent where your visitors' law requires it

## Links

- [Harvv Dashboard](https://harvv.com)
- [Documentation](https://harvv.com/#/for/websites)

## License

Apache 2.0
