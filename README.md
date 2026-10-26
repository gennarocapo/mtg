# Mind The Gap — Decision Workspace

A polished, Italian-language, static buyer-side property decision web app prototype. Publish on **GitHub Pages** without Node, builds or a server.

## Start and publish

1. Extract all files to a folder, then open `index.html` in Chrome / Edge. Some browser security restrictions may prevent PDF processing when opened as a `file://` URL; test PDFs via local HTTP or GitHub Pages.
2. Create a **public or private-with-supported-Pages** GitHub repository, upload the contents **at repository root** (not the ZIP), and commit.
3. In GitHub repository **Settings → Pages → Build and deployment**, choose **Deploy from a branch**, `main`, `/ (root)`; save. Visit the URL displayed in Pages. (Availability depends on GitHub plan and visibility settings.)
4. On every commit to main, GitHub Pages republishes the site.

## What is real vs demonstrative

- **Working:** create multiple properties by pasting ad text, storing a listing URL, or extracting text from a text-based PDF; infer *reported* criteria from visible keywords, edit facts, manually update evidence levels and notes; recalculate weighted decision-readiness scores; compare properties; select expert expertise; register video call/inspection interest; collect five-star feedback; export activity, booking, feedback and property data in CSV and JSON.
- **Not provided:** third-party portal scraping (GitHub Pages cannot bypass portals' CORS, bot restrictions, or data licenses), reliable market price estimates, OCR of scanned PDFs, automatic factual/official record verification, genuine experts or verified reviews, real payments, actual expert scheduling, a cross-user admin dashboard without backend configuration, legal or technical professional opinions.
- The professionals in the demo are **fictional**. Verified ratings and reviews must come from **genuinely completed, documented engagements**, not invented entries.
- `Decision readiness` is a transparent **coverage-of-evidence index**, *not* a property quality or risk score. The ten status fields have weights totaling 100. Missing = 0, ad-reported = 42%, document available = 75%, expert-verified = 100%, risk flagged = 25% coverage. **Risk remains visible** and should not be interpreted as a positive rating.
- The original buyer survey measured decision difficulty, comparison, available information, pricing uncertainty, technical/document risks, and priorities rather than providing a comprehensive technical property scoring standard. This prototype extends that scope through explicit hypotheses subject to calibration.

## Centralized logs for your research (optional)

By default everything is stored in each visitor's `localStorage`. **You cannot access logs from other visitors** unless you add a backend; CSV/JSON exports only cover the current visitor/browser.

For a basic central event collector, create a Supabase project, run `supabase.sql` in SQL Editor, edit the included `config.js` to fill in the Supabase **project URL and publishable key** (`sb_publishable_...`), then commit the file. `index.html` already loads it before `app.js`. Visitors can opt in via **Impostazioni**. The client sends event metadata only, not full property text or PDFs. You can see logs in the Supabase Table Editor or SQL Editor.

**Important privacy & security:** This is a research prototype, not a production privacy/compliance solution. Ask a privacy professional to review the privacy notice, consent flow, retention, data deletion, logging, and data processing agreements before testing with participants. Consent opt-out stops later sends but does not delete earlier server logs. Supabase public `anon` permits event insertion (and thus spam): protect using rate limits, abuse controls or a server-side proxy for a public-scale pilot. Backend availability and costs may change.

## How scoring behaves

Each property is independently assessed on:

| Criterion | Weight |
| --- | ---: |
| Price & economic sustainability | 15 |
| Surface & features | 10 |
| Location & accessibility | 10 |
| Condition & works | 11 |
| Energy & APE | 8 |
| Building compliance & cadastre | 12 |
| Condo & recurring costs | 8 |
| Technical risks & checks | 12 |
| Buyer priorities | 9 |
| Purchase timing & terms | 5 |

Keyword heuristics merely detect **mention of a topic** and mark it `Da annuncio`. They do not assess truth, legal sufficiency, authenticity or whether a price is fair. Users can amend source text and all evidence states; the readiness updates immediately.

## Files

- `index.html` — main web shell.
- `style.css` — responsive design.
- `app.js` — app logic, state, scoring, flows and analytics.
- `supabase.sql` — optional central event storage and least-privilege row policy.
- `config.example.js` — optional client config template.

MIT-style research prototype; do not present it as independent technical due diligence.
