Primary mobile tab bar: Home, Policies, Claims, Profile. Floating rounded card (28px radius) inset from the screen edges with a soft shadow, sitting above the page background. Active tab gets a brand-soft pill background (20px radius) behind its icon+label, with brand blue for icon+label; inactive tabs are muted text/icon with no background.

```jsx
<BottomNav active="claims" onChange={setTab} />
```
