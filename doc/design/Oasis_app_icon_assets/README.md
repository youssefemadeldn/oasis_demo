# Oasis App Icon Assets — flutter_launcher_icons

## Source
Cropped and upscaled from the transparent Oasis logo mark (the only clean,
non-watermarked source available). Original glyph was only ~60x64px, so these
are upscaled (Lanczos) — sharp enough for a demo/portfolio app icon on a
phone screen, but NOT print-quality. If you get a real high-res logo file
from Oasis later, redo this with that source.

## Files
- `assets/icon/icon.png` (1024x1024) — main icon, navy background (#0a1420),
  no transparency. Used for iOS + as the flat Android icon fallback.
- `assets/icon/icon_foreground.png` (1024x1024) — transparent background,
  logo sized to Android's adaptive-icon safe zone. Use with `adaptive_icon_foreground`.
- `assets/icon/icon_background.png` (1024x1024) — flat navy (#0a1420).
  Use with `adaptive_icon_background` (or just pass the hex string directly,
  see config below — no need to reference this file at all).

## Setup
1. Copy the `assets/icon/` folder into your Flutter project root (same level as `assets/`).
2. Add to `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.14.4

flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icon/icon.png"
  min_sdk_android: 21
  adaptive_icon_background: "#0a1420"
  adaptive_icon_foreground: "assets/icon/icon_foreground.png"
  remove_alpha_ios: true
  background_color_ios: "#0a1420"
```

3. Run:
```bash
flutter pub get
dart run flutter_launcher_icons
```

Note: `remove_alpha_ios: true` + `background_color_ios` is set because Apple
requires iOS icons to have zero transparency and fill the entire square —
`icon.png` already has a flat navy background so this is just a safety net.
