# Session Handoff — 2026-08-05

> **OUT OF PREVIOUS SESSION — NEW SESSION START**
>
> Read this file first. It contains everything from the prior session.

## What Was Done

- Ran `/readme-generator` end-to-end: deep-explored the repo (pubspec, DI, router, network layer, theme, both prior handoffs, git log, test file, Android/iOS platform config) and wrote a fact-based `README.md` at the project root. Backed up the stock `flutter create` README to `README.backup.md` first, per the skill's rules.
- User then asked to support the README with **mobile-frame screenshots of the real UI**, sourced from `doc/design/Oasis policyholder mobile app/`.
- Investigated that folder: `Oasis Policyholder App.dc.html` is **not** a set of static per-screen images — it's a single interactive React-based prototype (a proprietary "design-comp" runtime, `support.js`) that swaps between 12 screens via one `screen` state variable (`screenIs('home')`, `screenIs('claims')`, etc., toggled by a `go(screen, extra)` method on the mounted `Component` class).
- Asked the user how to source the screenshots (real Flutter app on simulator vs. script the design HTML vs. skip) — **user chose to script the design HTML prototype.**
- Built a working, reusable capture mechanism (see "Key References" below for the exact scripts) that:
  1. Serves the design folder over a local `python3 -m http.server` (avoids `file://` CORS issues with the prototype's module loader).
  2. Launches the user's actual installed Google Chrome headlessly via `puppeteer-core` (no browser download needed — confirmed network access, `npm install puppeteer-core` works fine in the scratchpad).
  3. Navigates to the `.dc.html` file, then for each target screen: walks the mounted page's **React fiber tree** (finds any DOM node with a `__reactFiber$...` key, walks to the fiber root, then depth-first-searches for a fiber whose `stateNode.logic` has a `.go()` method) to get a direct handle to the prototype's own logic instance — then calls `logic.go(screenName, extraStatePatch)`, the **exact same method the prototype's own buttons call**. This is far more robust than clicking through the UI (no coordinate/selector guessing, no multi-step wizard navigation needed to reach a specific claim/policy detail — just pass the id as `extra`).
  4. Screenshots each resulting screen state, clipped to a specific DOM element's bounding box.
  5. Saves 12 PNGs into `doc/design/screenshots/` and embeds them in the README as an HTML `<table>` mobile-frame gallery (GitHub renders `<table>`/`<img>` fine in Markdown).
- First pass clipped the **outer dark-bezel div** (`border-radius: 44px` in the rendered style — note: React normalizes inline styles to `"border-radius: 44px"` **with a space**, the first attempt's selector without the space matched nothing) — this produced screenshots that already look like a phone (dark rounded-rect bezel baked into the design mock itself). **This is the version currently committed** (commit `aca2c54`, "feat: add design mockup screenshots for policyholder app in README") and is what the user wants kept.
- User then asked for a **real iOS device frame** (Dynamic Island, side buttons, home indicator) around just the screen content, instead of the design's flat dark bezel. Built a second pipeline:
  - Re-captured clipping the **inner white screen div** instead (`border-radius: 32px` + `overflow: hidden` — this combination is what uniquely identifies it), giving raw screen-only PNGs (no bezel), confirmed exact 390:844 aspect ratio (780×1688 px at 2x scale).
  - Built an HTML/CSS iPhone-frame template (`frame_template.html` — graphite gradient body, Dynamic Island pill, side buttons, home-indicator bar) with a **reserved 50px black status-bar gap above the screenshot** (not overlaid on top of it — first attempt overlaid the island directly over real header text, e.g. covered part of "Ahmed Al-Otaibi" on the Home screen; fixed by growing the phone frame's total height and inserting the screenshot below the gap instead of cropping/overlaying).
  - Composited all 12 screenshots into this frame via a second puppeteer script (`compose_frames.js`), output visually verified (home, splash, policies, login all checked) — looked correct, no cropped content, clean device-frame look.
  - **User interrupted before this was finalized**: explicitly said *"dont update read me file and me discrared the new images, i will keep the first making onse"* (keep the original dark-bezel screenshots, discard the iOS-framed replacements, don't touch the README further this session).
- Confirmed final repo state is clean: `git status` shows nothing to commit, working tree matches commit `aca2c54` exactly (the dark-bezel version). The iOS-framed images were never written back into the repo's `doc/design/screenshots/` (they only ever existed in the scratchpad `framed/` dir, which has been discarded/is session-scoped).
- Cleaned up: killed the local `http.server` process, removed the scratchpad's `node_modules`.

## Bugs Found

None in the app itself — this was a tooling/documentation session, not a debugging session.

## Files Changed

| File | Change | Why |
|---|---|---|
| `README.md` | Full rewrite (Tech Stack, Architecture, Features, Getting Started, Project Structure, API Overview, State Management, DI, Env Vars, Testing, CI/CD, Contributing, Known Limitations, License) + a "Screens" mobile-frame gallery section | `/readme-generator` run, then user's screenshot request |
| `README.backup.md` | New — backup of the stock `flutter create` README | Required by the skill before overwriting an existing README |
| `doc/design/screenshots/01-splash.png` … `12-support.png` | New — 12 PNGs, dark-bezel design-mock screenshots (the **kept** version) | User's mobile-frame gallery request |

Both are already committed (`aca2c54`). Nothing is pending/uncommitted.

## Files Audited (no changes)

| File | Checked For | Result |
|---|---|---|
| `pubspec.yaml`, `lib/main.dart`, `lib/core/router/app_router.dart`, `lib/core/router/app_routes.dart`, `lib/core/di/*`, `lib/core/network/*`, `lib/core/theme/app_colors.dart`, `lib/core/router/main_shell_screen.dart` | Real versions, routes, DI scopes, architecture facts for the README | Content used directly in README, no discrepancies |
| `doc/handoffs/001-foundation-scaffold/*`, `doc/handoffs/002-policyholder-app-ui/*` | Prior session context, known limitations | Fed directly into README's "Known Limitations" section |
| `test/widget_test.dart` | Test coverage state | Confirmed still the broken stock counter test — documented honestly in README |
| `.github/`, `bitrise.yml`, etc. | CI/CD config | None found — documented as "Not detected" |
| `doc/design/Oasis policyholder mobile app/Oasis Policyholder App.dc.html`, `support.js` | How the design prototype's screen-switching works | Fully reverse-engineered: `class Component extends DCLogic` (`DCLogic` = `StreamableLogic`), `state.screen` + `go(screen, extra)` method, mounted via a custom `<x-dc>`/React runtime |

## Pending Tasks

- [ ] **This session's explicit next task (user-specified via `/session-handoff` args):** update the `readme-generator` skill (`/Users/youssefemadeldin.ai/.claude/skills/readme-generator/SKILL.md`) to document this design-screenshot capture mechanism **as a first implementation, without the iOS device frame part** — i.e., only the dark-bezel/raw-capture pipeline (steps 1–5 under "What Was Done" above), not the iPhone-frame compositing step. The skill should instruct: when a project has a `claude-design/`-style folder or an interactive `.dc.html`-style design prototype, use headless Chrome (`puppeteer-core` against the user's installed Chrome, no browser download) + a local static file server + the React-fiber-walk-to-find-the-logic-instance trick to drive the prototype through its own `go()`/state-setting method and capture real per-screen screenshots, then embed them in the README as an HTML `<table>` mobile-frame gallery.
- [ ] iOS device-frame compositing (Dynamic Island/side-buttons/home-indicator) was explicitly discarded this session — **do not re-add it to the skill or the README** unless the user asks again. If asked again later, the working `frame_template.html` + `compose_frames.js` approach (described above) is proven and can be redone from scratch (nothing from that pipeline was preserved on disk outside the now-cleared scratchpad).
- [ ] `test/widget_test.dart` is still broken (documented in README, not fixed).
- [ ] `flutter_launcher_icons` still unconfigured/unrun (documented in README, not fixed).
- [ ] App has not been verified running on a real simulator/device end-to-end (documented in README, not fixed).

## What's Next (ordered)

1. Open `/Users/youssefemadeldin.ai/.claude/skills/readme-generator/SKILL.md` and add a new step/section (likely under "STEP 1 — Project Fingerprinting" or a new "STEP 1.5 — Design Prototype Detection") that:
   - Detects a design-source folder (e.g. `doc/design/`, `claude-design/`, or any `*.dc.html` file) alongside the codebase.
   - If found, documents the capture mechanism: local static server → `puppeteer-core` against the installed Chrome (`/Applications/Google Chrome.app/Contents/MacOS/Google Chrome` on macOS) → for `.dc.html`-style React prototypes, walk the React fiber tree to find the mounted logic instance and call its own screen-navigation method directly (more robust than simulating clicks) → clip-and-screenshot the **outer/bezel-inclusive** container (this session's kept approach — no iOS frame compositing) → save to `doc/design/screenshots/` (or equivalent) → embed in README as an HTML `<table>` gallery.
   - Explicitly notes the iOS-frame compositing variant as a *documented-but-not-default* follow-up option, not something to auto-apply.
2. Do not touch `README.md` or `doc/design/screenshots/` unless the user asks — both are finalized and committed as-is for this session.

## Key References

- Approved/kept README: `README.md` (repo root), backup at `README.backup.md`
- Kept screenshots: `doc/design/screenshots/01-splash.png` … `12-support.png` (dark-bezel version, committed in `aca2c54`)
- Design prototype source: `doc/design/Oasis policyholder mobile app/Oasis Policyholder App.dc.html` + `support.js` (proprietary React-based runtime)
- Skill to update next session: `/Users/youssefemadeldin.ai/.claude/skills/readme-generator/SKILL.md`
- The exact working capture scripts were written to the session's scratchpad (now cleared): `capture.js` (raw/bezel capture via React-fiber `go()` calls) and, for the discarded iOS-frame variant, `frame_template.html` + `compose_frames.js`. None of these script files were committed into the repo — if the skill update wants a reusable script checked in, it will need to be rewritten from the description in this handoff (the logic is fully specified above and is straightforward to reproduce).

## Clarifications & Decisions

| Question | Answer |
|---|---|
| How should screenshots be sourced — run real Flutter app on simulator, script the design HTML prototype, or skip real screenshots? | Script the design HTML prototype |
| (implicit, via interruption) Keep the iOS-device-frame version or the original dark-bezel version? | Keep the **original dark-bezel version** (already committed as `aca2c54`); discard the iOS-frame replacements; don't touch the README further |

## Notes

- The design prototype's inline styles are React-normalized at render time — e.g. `border-radius:44px` in the raw HTML source renders as `"border-radius: 44px"` **with a space** in the live DOM. Any future selector matching against `element.getAttribute('style')` must account for this (use a regex like `/border-radius:\s*44px/`, not a literal substring match) — this cost one failed capture attempt this session.
- The React fiber walk technique (finding `stateNode.logic` with a `.go()` method) is broadly reusable for **any** `.dc.html`-style prototype built on this same runtime (`support.js`/`DCLogic`/`StreamableLogic`) — it is not specific to this app's screen names, since it just calls whatever `go`-like method the mounted logic class exposes. Worth generalizing in the skill rather than hardcoding this app's 12 screen names.
- `puppeteer-core` (not full `puppeteer`) was used specifically to avoid downloading a bundled Chromium — it drives the already-installed Google Chrome via `executablePath`. This keeps the mechanism fast and network-light for future runs.
- A local static file server (`python3 -m http.server`) was necessary — loading the `.dc.html` directly via `file://` risks CORS/fetch failures in the prototype's asset-loading code; serving over `http://localhost` sidesteps this entirely.
