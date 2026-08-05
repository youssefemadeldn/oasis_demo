# Project Context: Oasis Policyholder Companion App (MVP)

## Why this project exists
Youssef (Joe) — Flutter developer, 2+ years production experience — interviewed for a
Flutter Developer role at **Oasis Computer Systems** (a B2B enterprise software house).
During the interview, he learned the company has **no existing Flutter/mobile team** and
is actively planning to build **mobile companion apps** for its enterprise products based
on client demand. He is now building a small, self-directed **MVP demo app** and plans to
send it (as an APK, not a store listing) to his interviewer as a proactive follow-up
before Oasis makes an offer decision — to demonstrate initiative and directly relevant
skill.

**This is a conceptual/portfolio MVP, not a real Oasis product build.** It is not based on
access to Oasis's actual backend, API, or internal systems — it's a plausible, well-reasoned
mobile translation of their existing desktop product, built from public information only.
Any documentation, comments, or copy this agent generates should reflect that honestly if
ever asked — never imply this was built with real internal Oasis data or API access.

## Company & product context (source: public research, not internal docs)
- **Oasis Computer Systems Co. Ltd.** — Jeddah, Saudi Arabia. B2B enterprise software
  house, ~15+ years in business, 11-50 employees, regional presence in Saudi Arabia, UAE,
  Lebanon, and Mauritius. Serves 7 countries, 1500+ users, 100+ corporate clients.
- **Product suite (all "Customized Systems", i.e. bespoke per client, not off-the-shelf):**
  - **Oasis-IBS** (Insurance Brokers System) — flagship product. Full broking cycle:
    underwriting, quotations, policy management, claims processing, billing/accounting.
  - **Oasis-IMS** (Insurance Management System) — same idea, for insurance companies
    rather than brokers. Marketed features include unified claims management, sales lead
    tracking, and "Real-Time Statistics" dashboards.
  - **Oasis-HIS** (Health Information System) — appointment booking, medical files,
    results/reporting, inter-department connections.
  - **Oasis-TPA** (Medical Third-Party Administrator) — benefits plans, claims/premium
    processing, cost control for medical insurance administrators.
  - **Oasis-ERP** — accounting, procurement, inventory, fixed assets, HR/payroll.
- **Target customers:** insurance brokers/agents, insurance companies, TPAs, and medical
  facilities — not individual consumers directly. B2B sales-led (no self-serve demo/signup;
  relationship-driven, long implementation cycles, e.g. GMIB Beirut's transition from a
  paper-based process).
- **Desktop product UI style (from real product screenshots seen in marketing):** dense,
  tab-based multi-panel dashboards (top nav: Master Table / Clients / Business Development /
  Production / Customer Service / Claims / Staff Panel / System Admin), sortable data tables,
  color-coded status labels (Pending, New Request, Closed, Cancelled, Invoiced, Under
  Process, Missing).

## What this app is
A **policyholder-facing mobile companion app** built conceptually on top of **Oasis-IBS**
(their flagship, most-referenced product). It lets an end policyholder (a client of an
insurance broker using Oasis-IBS) do on mobile what today likely requires calling or
emailing their broker:
- View their active insurance policies
- Submit a new claim (with photo/document upload)
- Track claim status
- Contact their broker directly

This is the natural "last mile" extension of Oasis-IBS's claims/policy workflow — translating
their dense desktop dashboard experience into a clean, trustworthy mobile experience for the
end customer.

## Tech stack & conventions (match Joe's existing production style)
- **Flutter + Dart**, Clean Architecture, **BLoC/Cubit** for state management.
- **No real backend for this MVP** — use local mock data (hardcoded/local JSON) structured
  as if it came from a REST API, so the data layer can later be swapped for real Dio-based
  API calls with minimal refactor (repository pattern — keep data sources abstracted behind
  interfaces from day one).
- Firebase not required for this MVP (no push notifications needed for a demo — mock the
  Notifications screen with static data instead).
- Structure the project so it could plausibly evolve into production code (this is a demo
  of engineering judgment, not just a Figma-to-code exercise) — but do not over-engineer
  for a scope this small either.
- **Output target: a debug/release APK**, not a Play Store listing. Build via
  `flutter build apk --release`. Optionally set up Firebase App Distribution later for a
  clean install link, but that's not required for v1.

## Visual design system (source: Claude Design export, in `design-reference/`)
Colors and typography were derived from Oasis's real logo and LinkedIn/marketing materials
(not a real design system Oasis provided — flagged as inferred). Match these exactly, do
not introduce new colors:

- **Primary brand color:** `#29ABE2` (bright cyan-blue). Full ramp blue-50 → blue-900.
- **Dark surfaces / marketing backgrounds:** navy/charcoal ramp, `#0a1420` (navy-900) →
  `#2a4666` (navy-500).
- **IMPORTANT:** Do NOT use green as a brand/primary color. One legacy website logo asset
  was misleadingly filenamed "green" but Oasis's actual current brand (logo, LinkedIn,
  product marketing) is blue/charcoal only.
- **Status color language** (carried over from their real desktop claim/lead tables — reuse
  this exact mapping for claim status badges):
  - Pending → amber/yellow
  - Closed → green
  - Rejected → red
  - Under Process → orange
  - Invoiced → blue/purple
  - Cancelled → gray
- **Typography:** No official Oasis brand font was found publicly. Substituted:
  **Poppins** for headlines/display, **Inter** for body/UI text. Arabic text uses a
  system-safe fallback (Tahoma). If Joe ever gets Oasis's real font names, swap these.
- **Tone/voice:** professional, confident, B2B-enterprise register — declarative benefit
  statements, not playful. In-app UI copy: short, task-first labels ("Submit a Claim",
  "Active Policies"), sentence case, **no exclamation marks, no emoji in the product UI**
  (emoji only appear in Oasis's external marketing captions, never in-product).
- **Layout:** desktop product is dense data tables; this mobile app should translate that
  into **card-based list layouts** (not tables) — see full component/token reference in
  `design-reference/` (colors.css, typography.css, spacing.css, effects.css) and the
  click-through HTML prototype (`design-reference/prototype.dc.html`) exported from
  Claude Design — treat that prototype as the visual source of truth for spacing, radii,
  and component look.

## Screens to build (11 total, connected flow)
1. **Splash/Onboarding** — logo on navy background, short value prop, Get Started button.
2. **Login** — policy/national ID + password, forgot-password link.
3. **Home/Dashboard** — greeting, summary cards (active policies count, open claims count),
   quick actions, recent activity.
4. **My Policies** (list) — card per policy (type, number, expiry, status tag).
5. **Policy Details** — coverage info, dates, premium, documents, "Submit a Claim" CTA.
6. **Submit a Claim** — multi-step: select policy → claim type/description → upload
   photos/documents → review & submit.
7. **My Claims** (list) — card per claim with StatusBadge-equivalent widget.
8. **Claim Status Tracking** — vertical timeline/stepper (Submitted → Under Review →
   Processing → Approved/Rejected), reference number, linked policy, document thumbnails.
9. **Notifications** — list, unread indicator, timestamps (static mock data is fine).
10. **Profile/Settings** — policyholder info, **Arabic/English language toggle** (prominent
    — this maps to Oasis's real bilingual Arabic-first marketing), notification preferences,
    logout.
11. **Support/Contact Broker** — broker contact card (name, phone, email — same fixed
    phone/website/email order pattern Oasis uses in its real marketing), Call/Message
    buttons, optional FAQ accordion.

## What "done" looks like for v1
- All 11 screens navigable end-to-end with mock data, visually matching the design tokens
  above (spot-check against `design-reference/prototype.dc.html`).
- Arabic/English toggle actually switches UI text (even if only a subset of strings are
  translated for the demo — this is the single most important "wow" detail for this
  specific audience, since Oasis's own marketing is bilingual Arabic-first).
- A release APK that installs cleanly on a physical Android device for a live demo/handoff.
- Clean, readable code — this will likely be shown to a **senior backend (.NET) developer**
  who will care more about architecture clarity and API-integration readiness than visual
  polish.
