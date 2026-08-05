# Oasis Design System

Design system for **Oasis Computer Systems** (Jeddah, Saudi Arabia) — a B2B enterprise software house building customized insurance and healthcare systems: **Oasis-IBS** (insurance brokers), **Oasis-IMS** (insurance management), **Oasis-HIS** (health information system), **Oasis-TPA** (medical claims administration), and **Oasis-ERP**. Customers are insurance brokers, insurance companies, and medical facilities across Saudi Arabia, UAE, Lebanon, and Mauritius.

This design system targets a **mobile companion app** concept for Oasis's insurance products: policy management + claims submission for end policyholders, translating the company's dense desktop/dashboard software into a clean mobile experience.

## Sources
No Figma file, GitHub repo, or codebase was attached for this run — this design system is built from brand-guidelines-only materials the user uploaded directly:
- `uploads/logo.png`, `uploads/oasis_computer_systems_co_ltd_logo.jpeg` — official logo files
- `uploads/1777289257673.jpeg`, `uploads/1777289258356.jpeg` — Arabic/English social marketing creative ("Real-Time Statistics for Every Insurance Company")
- `uploads/Screenshot 2026-08-05 at 10.05.54 AM.png`, `...10.10.56 AM.png` — LinkedIn posts showing Oasis-IMS product screenshots (desktop dashboard) and further ad creative
- Chat brief describing the product suite, target markets, and brand-color correction (primary is bright blue, not green — a legacy asset was misleadingly named "green")

If a Figma file, GitHub repo, or product codebase becomes available, re-run against that source — it will supersede the visual inferences below.

## Products
| Product | Purpose |
|---|---|
| Oasis-IBS | Insurance broker management |
| Oasis-IMS | Insurance management (leads, slips, claims, production) |
| Oasis-HIS | Health information system |
| Oasis-TPA | Medical claims administration |
| Oasis-ERP | Enterprise resource planning |
| **Mobile companion app** (this kit) | Policyholder-facing: view policies, submit/track claims |

## Content fundamentals
- **Bilingual, Arabic-first in marketing.** Social posts run full Arabic copy with an English mirror underneath — always translate literally and completely, never summarize one language shorter than the other.
- **Tone:** confident, plainly stated benefit claims — "Real-Time Statistics for Every Insurance Company," "The Question Isn't 'Do you need an IMS system?' The question is 'When will your business need one?'" Declarative, B2B-sales register, not playful.
- **Structure:** marketing copy leans on a checklist rhythm — short benefit lines each opening with a ✅, closing with a 📌 "helps/improves" line and a 📧/📞/🌐 contact block (phone, website, email) repeated verbatim on every post.
- **Person:** mostly third-person/descriptive ("Claims management is one of the most sensitive processes in insurance companies…") rather than direct "you" address, though some lines address the reader directly ("As your operations grow…").
- **Emoji:** used sparingly and functionally in marketing captions only — ✅ for benefit bullets, 📌/📧/📞/🌐 as inline icons before contact info. Never used in the product UI itself (data tables, status labels are plain text).
- **Casing:** headline treatments are Title Case; body copy is sentence case; contact info (phone/site/email) is presented as a fixed three-line block, always in the same order.
- **Vibe:** enterprise/insurance-software confidence — data, accuracy, and process control are the recurring themes (real-time, accuracy, visibility, tracking), not lifestyle or emotional appeal.
- **Mobile app copy (this kit):** short, task-first labels ("Submit a Claim," "Active Policies," "Track Status") — sentence case, no exclamation points, no emoji.

## Visual foundations
- **Color:** primary brand color is a bright cyan-blue, **`#29ABE2`** (`--blue-400`), used for the wordmark, CTA bars/buttons, and chart bars. A dark charcoal-to-blue gradient globe is the icon mark. Marketing creative alternates between a light background (white/very pale blue-gray, subtle hexagon-pattern texture) and a **dark navy/near-black gradient background** (`--navy-900`–`--navy-700`) for product-screenshot ads — laptop mockups glow with blue rim-light against near-black. Neutral grays support desktop data tables. **Do not use green as a brand color** — despite one legacy asset filename, current brand usage (LinkedIn, product marketing) is blue/charcoal only.
- **Status color language (carried over from the desktop products' claim/lead tables):** yellow/amber = pending or new request, green = closed/success, red = rejected, orange = under process, blue/purple = invoiced, gray = cancelled/missing. This maps directly to `StatusBadge` in this kit.
- **Type:** headline/display type in marketing is a chunky, rounded-terminal bold sans (**substituted with Poppins** here — see Font substitution note below); UI/body type is a clean, neutral grotesque (**Inter**). Arabic copy uses a system Arabic-safe sans (Tahoma fallback) since no Arabic webfont was provided.
- **Spacing:** 4px base scale (4/8/12/16/20/24/32/40/48/64/80).
- **Backgrounds:** flat colors or navy gradients only — no photography, no hand-drawn illustration, no repeating pattern beyond a faint hexagon-grid texture on light marketing backgrounds (not reproduced in UI, only noted as a possible marketing-page texture).
- **Animation:** no motion language observed in source materials; this kit uses conservative, standard-easing transitions (120–200ms, `cubic-bezier(.4,0,.2,1)`) for hover/press/toggle states only — no bounces, no elaborate choreography.
- **Hover/press states:** buttons darken slightly on hover (`brightness(0.94)`) and scale down slightly on press (`scale(0.97)`) — subtle, no color inversion.
- **Borders & shadows:** cards use a thin 1px neutral border plus a soft, low-opacity shadow (`--shadow-sm`/`--shadow-md`) — no heavy drop shadows, no inner shadows, no colored borders. Primary buttons get a soft brand-blue glow shadow.
- **Corner radii:** 6px (controls/checkboxes), 10px (inputs/buttons), 16px (cards), 22px (large sheets), pill (badges, switches).
- **Transparency/blur:** none observed; used sparingly here only for the focus-ring glow (`rgba` blue at low opacity) and modal scrim.
- **Imagery color vibe:** none — no photography in source material; product screenshots are the only imagery, shown as clean laptop-mockup renders with blue backlight, not warm/grainy.
- **Layout:** desktop products are dense, tab-based multi-panel dashboards (top nav: Master Table / Clients / Business Development / Production / Customer Service / Claims / Staff Panel / System Admin) with sortable tables and dropdown row actions. The mobile translation swaps dense tables for **card-based list rows** with the same status-badge vocabulary.

## Font substitution — please flag/replace
No font files or exact family names were provided. Headline/display type was **approximated with Poppins** (closest widely-available geometric rounded-bold match to the marketing headline style) and body/UI type with **Inter**. If Oasis has an official brand typeface (or exact Google Font name), please share it and this system will be updated.

## Iconography
No icon set, icon font, or SVG library was found in the provided materials — the desktop product screenshots show generic toolbar icons at low resolution only, not clean enough to trace or copy. This kit hand-draws a **minimal set of stroke-based navigation icons** (home, policies, claims, profile, back-chevron, dropdown-caret) directly in `components/navigation/BottomNav.jsx` and `TopBar.jsx` using plain inline SVG at 1.8px stroke weight, matching the clean/geometric feel of the brand. Emoji appear only in marketing captions (see Content Fundamentals), never in-product. If Oasis has a real icon library (Figma, icon font, SVG sprite), attach it and this substitution will be replaced with the real assets.

## Assets
- `assets/logo-full.png` — official transparent-background lockup (globe mark + "OASIS COMPUTER SYSTEMS" wordmark), safe on both light and dark surfaces
- `assets/logo-mark.jpeg` — compact logo variant

## Components
- `components/core/Button.jsx` — primary/secondary/ghost/danger/dark button
- `components/core/StatusBadge.jsx` — pending/closed/rejected/processing/invoiced/cancelled status pill
- `components/core/Card.jsx` — base rounded surface
- `components/core/Tag.jsx` — small classifier chip
- `components/core/Tabs.jsx` — underline tab switcher
- `components/core/Dialog.jsx` — bottom-sheet modal
- `components/core/Toast.jsx` — inline notification banner
- `components/forms/Input.jsx` — labeled text field
- `components/forms/Select.jsx` — labeled dropdown
- `components/forms/Checkbox.jsx` — custom checkbox
- `components/forms/Switch.jsx` — toggle switch
- `components/navigation/BottomNav.jsx` — 4-tab mobile nav bar
- `components/navigation/TopBar.jsx` — screen header

### Intentional additions
No component-inventory source (Figma/codebase) was provided, so this is an authored-from-scratch standard set sized to the mobile app's needs (Button, Badge, Card, Tag, Tabs, Dialog, Toast, Input, Select, Checkbox, Switch, BottomNav, TopBar) rather than a copied inventory.

## UI kit
`ui_kits/mobile-app/` — click-through recreation of the policyholder mobile app: Login → Home → Policies → Policy Detail → Claims → Submit Claim → Claim Detail → Profile. See `ui_kits/mobile-app/README.md`.

## Index
- `styles.css` — root stylesheet (imports `tokens/*.css`)
- `tokens/colors.css`, `typography.css`, `spacing.css`, `effects.css`
- `guidelines/` — foundation specimen cards (Design System tab)
- `assets/` — logos
- `components/` — reusable primitives (see above)
- `ui_kits/mobile-app/` — full mobile app kit
- `SKILL.md` — Claude Code / Agent Skills compatible skill file
