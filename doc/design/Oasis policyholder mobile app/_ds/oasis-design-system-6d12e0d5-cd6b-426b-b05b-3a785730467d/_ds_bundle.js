/* @ds-bundle: {"format":4,"namespace":"OasisDesignSystem_6d12e0","components":[{"name":"Button","sourcePath":"components/core/Button.jsx"},{"name":"Card","sourcePath":"components/core/Card.jsx"},{"name":"Dialog","sourcePath":"components/core/Dialog.jsx"},{"name":"StatusBadge","sourcePath":"components/core/StatusBadge.jsx"},{"name":"Tabs","sourcePath":"components/core/Tabs.jsx"},{"name":"Tag","sourcePath":"components/core/Tag.jsx"},{"name":"Toast","sourcePath":"components/core/Toast.jsx"},{"name":"Checkbox","sourcePath":"components/forms/Checkbox.jsx"},{"name":"Input","sourcePath":"components/forms/Input.jsx"},{"name":"Select","sourcePath":"components/forms/Select.jsx"},{"name":"Switch","sourcePath":"components/forms/Switch.jsx"},{"name":"BottomNav","sourcePath":"components/navigation/BottomNav.jsx"},{"name":"TopBar","sourcePath":"components/navigation/TopBar.jsx"}],"sourceHashes":{"components/core/Button.jsx":"e1e005b76514","components/core/Card.jsx":"8e5601606580","components/core/Dialog.jsx":"421572ab5ee1","components/core/StatusBadge.jsx":"017e60ee8ca8","components/core/Tabs.jsx":"7ddba2e55a4f","components/core/Tag.jsx":"33125347552e","components/core/Toast.jsx":"fbcf37ae6160","components/forms/Checkbox.jsx":"6dba5857816f","components/forms/Input.jsx":"297c383d9721","components/forms/Select.jsx":"11d7fe4fc950","components/forms/Switch.jsx":"3071216d95c8","components/navigation/BottomNav.jsx":"fa5e3fbc9069","components/navigation/TopBar.jsx":"4a19b66847b4","ui_kits/mobile-app/ClaimDetailScreen.jsx":"49bfcf193128","ui_kits/mobile-app/ClaimsScreen.jsx":"bcf9d98dd5c0","ui_kits/mobile-app/HomeScreen.jsx":"5d94a220b408","ui_kits/mobile-app/LoginScreen.jsx":"455fb8c6b44c","ui_kits/mobile-app/PoliciesScreen.jsx":"2709f24f2e92","ui_kits/mobile-app/PolicyDetailScreen.jsx":"092539e4bfc6","ui_kits/mobile-app/ProfileScreen.jsx":"d545a5ab9352","ui_kits/mobile-app/SubmitClaimScreen.jsx":"ff7a2bb47bca","ui_kits/mobile-app/mockData.js":"d93739bf3d88"},"inlinedExternals":[],"unexposedExports":[]} */

(() => {

const __ds_ns = (window.OasisDesignSystem_6d12e0 = window.OasisDesignSystem_6d12e0 || {});

const __ds_scope = {};

(__ds_ns.__errors = __ds_ns.__errors || []);

// components/core/Button.jsx
try { (() => {
const sizes = {
  sm: {
    padding: '8px 14px',
    fontSize: 'var(--fs-body-sm)',
    gap: 6
  },
  md: {
    padding: '11px 18px',
    fontSize: 'var(--fs-body-md)',
    gap: 8
  },
  lg: {
    padding: '14px 22px',
    fontSize: 'var(--fs-body-lg)',
    gap: 8
  }
};
function variantStyle(variant) {
  switch (variant) {
    case 'secondary':
      return {
        background: 'var(--gray-0)',
        color: 'var(--blue-500)',
        border: '1px solid var(--border-strong)'
      };
    case 'ghost':
      return {
        background: 'transparent',
        color: 'var(--blue-500)',
        border: '1px solid transparent'
      };
    case 'danger':
      return {
        background: 'var(--status-rejected-dot)',
        color: '#fff',
        border: '1px solid transparent'
      };
    case 'dark':
      return {
        background: 'var(--navy-900)',
        color: '#fff',
        border: '1px solid transparent'
      };
    default:
      return {
        background: 'var(--color-brand)',
        color: 'var(--text-on-brand)',
        border: '1px solid transparent'
      };
  }
}
function Button({
  children,
  variant = 'primary',
  size = 'md',
  icon,
  disabled,
  full,
  onClick,
  type = 'button'
}) {
  const s = sizes[size] || sizes.md;
  const v = variantStyle(variant);
  return /*#__PURE__*/React.createElement("button", {
    type: type,
    disabled: disabled,
    onClick: onClick,
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      justifyContent: 'center',
      gap: s.gap,
      padding: s.padding,
      fontSize: s.fontSize,
      fontFamily: 'var(--font-body)',
      fontWeight: 'var(--fw-semibold)',
      borderRadius: 'var(--radius-md)',
      cursor: disabled ? 'not-allowed' : 'pointer',
      width: full ? '100%' : 'auto',
      opacity: disabled ? 0.45 : 1,
      transition: 'filter var(--dur-fast) var(--ease-standard), transform var(--dur-fast) var(--ease-standard)',
      boxShadow: variant === 'primary' && !disabled ? 'var(--shadow-brand)' : 'none',
      ...v
    },
    onMouseEnter: e => {
      if (!disabled) e.currentTarget.style.filter = 'brightness(0.94)';
    },
    onMouseLeave: e => {
      e.currentTarget.style.filter = 'none';
    },
    onMouseDown: e => {
      if (!disabled) e.currentTarget.style.transform = 'scale(0.97)';
    },
    onMouseUp: e => {
      e.currentTarget.style.transform = 'scale(1)';
    }
  }, icon, children);
}
Object.assign(__ds_scope, { Button });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Button.jsx", error: String((e && e.message) || e) }); }

// components/core/Card.jsx
try { (() => {
function Card({
  children,
  padded = true,
  style,
  onClick
}) {
  return /*#__PURE__*/React.createElement("div", {
    onClick: onClick,
    style: {
      background: 'var(--surface-card)',
      borderRadius: 'var(--radius-lg)',
      border: '1px solid var(--border-default)',
      boxShadow: 'var(--shadow-sm)',
      padding: padded ? 'var(--space-5)' : 0,
      cursor: onClick ? 'pointer' : 'default',
      ...style
    }
  }, children);
}
Object.assign(__ds_scope, { Card });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Card.jsx", error: String((e && e.message) || e) }); }

// components/core/Dialog.jsx
try { (() => {
function Dialog({
  open,
  title,
  children,
  onClose,
  actions
}) {
  if (!open) return null;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      inset: 0,
      background: 'rgba(10,20,32,0.5)',
      display: 'flex',
      alignItems: 'flex-end',
      justifyContent: 'center',
      zIndex: 50
    },
    onClick: onClose
  }, /*#__PURE__*/React.createElement("div", {
    onClick: e => e.stopPropagation(),
    style: {
      background: 'var(--surface-card)',
      borderRadius: '20px 20px 0 0',
      padding: 'var(--space-6)',
      width: '100%',
      maxWidth: 420,
      boxShadow: 'var(--shadow-lg)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      width: 36,
      height: 4,
      borderRadius: 2,
      background: 'var(--gray-200)',
      margin: '0 auto 16px'
    }
  }), title && /*#__PURE__*/React.createElement("h3", {
    style: {
      margin: '0 0 8px',
      fontSize: 'var(--fs-title-md)',
      fontWeight: 'var(--fw-bold)',
      color: 'var(--text-primary)'
    }
  }, title), /*#__PURE__*/React.createElement("div", {
    style: {
      color: 'var(--text-secondary)',
      fontSize: 'var(--fs-body-md)',
      lineHeight: 'var(--lh-normal)'
    }
  }, children), actions && /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 10,
      marginTop: 20
    }
  }, actions)));
}
Object.assign(__ds_scope, { Dialog });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Dialog.jsx", error: String((e && e.message) || e) }); }

// components/core/StatusBadge.jsx
try { (() => {
const MAP = {
  pending: {
    bg: 'var(--status-pending-bg)',
    fg: 'var(--status-pending-fg)',
    dot: 'var(--status-pending-dot)',
    label: 'Pending'
  },
  closed: {
    bg: 'var(--status-closed-bg)',
    fg: 'var(--status-closed-fg)',
    dot: 'var(--status-closed-dot)',
    label: 'Closed'
  },
  rejected: {
    bg: 'var(--status-rejected-bg)',
    fg: 'var(--status-rejected-fg)',
    dot: 'var(--status-rejected-dot)',
    label: 'Rejected'
  },
  processing: {
    bg: 'var(--status-processing-bg)',
    fg: 'var(--status-processing-fg)',
    dot: 'var(--status-processing-dot)',
    label: 'Under Process'
  },
  invoiced: {
    bg: 'var(--status-invoiced-bg)',
    fg: 'var(--status-invoiced-fg)',
    dot: 'var(--status-invoiced-dot)',
    label: 'Invoiced'
  },
  cancelled: {
    bg: 'var(--status-cancelled-bg)',
    fg: 'var(--status-cancelled-fg)',
    dot: 'var(--status-cancelled-dot)',
    label: 'Cancelled'
  }
};
function StatusBadge({
  status = 'pending',
  label
}) {
  const m = MAP[status] || MAP.pending;
  return /*#__PURE__*/React.createElement("span", {
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      gap: 6,
      background: m.bg,
      color: m.fg,
      fontFamily: 'var(--font-body)',
      fontSize: 'var(--fs-caption)',
      fontWeight: 'var(--fw-semibold)',
      padding: '4px 10px',
      borderRadius: 'var(--radius-pill)',
      lineHeight: 1.4
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      width: 6,
      height: 6,
      borderRadius: '50%',
      background: m.dot,
      flexShrink: 0
    }
  }), label || m.label);
}
Object.assign(__ds_scope, { StatusBadge });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/StatusBadge.jsx", error: String((e && e.message) || e) }); }

// components/core/Tabs.jsx
try { (() => {
const {
  useState
} = React;
function Tabs({
  tabs = [],
  defaultIndex = 0
}) {
  const [active, setActive] = useState(defaultIndex);
  return /*#__PURE__*/React.createElement("div", {
    style: {
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 4,
      borderBottom: '1px solid var(--border-default)'
    }
  }, tabs.map((t, i) => /*#__PURE__*/React.createElement("button", {
    key: t.label,
    onClick: () => setActive(i),
    style: {
      border: 'none',
      background: 'none',
      cursor: 'pointer',
      padding: '10px 16px',
      fontSize: 'var(--fs-body-md)',
      fontWeight: 'var(--fw-semibold)',
      color: active === i ? 'var(--blue-500)' : 'var(--text-muted)',
      borderBottom: active === i ? '2px solid var(--color-brand)' : '2px solid transparent',
      marginBottom: -1
    }
  }, t.label))), /*#__PURE__*/React.createElement("div", {
    style: {
      paddingTop: 'var(--space-4)'
    }
  }, tabs[active] && tabs[active].content));
}
Object.assign(__ds_scope, { Tabs });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Tabs.jsx", error: String((e && e.message) || e) }); }

// components/core/Tag.jsx
try { (() => {
function Tag({
  children,
  tone = 'neutral'
}) {
  const tones = {
    neutral: {
      bg: 'var(--gray-100)',
      fg: 'var(--text-secondary)'
    },
    brand: {
      bg: 'var(--color-brand-soft)',
      fg: 'var(--blue-600)'
    },
    dark: {
      bg: 'var(--navy-700)',
      fg: 'var(--text-on-dark)'
    }
  };
  const t = tones[tone] || tones.neutral;
  return /*#__PURE__*/React.createElement("span", {
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      background: t.bg,
      color: t.fg,
      fontFamily: 'var(--font-body)',
      fontSize: 'var(--fs-micro)',
      fontWeight: 'var(--fw-semibold)',
      textTransform: 'uppercase',
      letterSpacing: '0.03em',
      padding: '3px 8px',
      borderRadius: 'var(--radius-sm)'
    }
  }, children);
}
Object.assign(__ds_scope, { Tag });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Tag.jsx", error: String((e && e.message) || e) }); }

// components/core/Toast.jsx
try { (() => {
const tones = {
  success: {
    bg: 'var(--status-closed-bg)',
    fg: 'var(--status-closed-fg)'
  },
  error: {
    bg: 'var(--status-rejected-bg)',
    fg: 'var(--status-rejected-fg)'
  },
  info: {
    bg: 'var(--color-brand-soft)',
    fg: 'var(--blue-600)'
  }
};
function Toast({
  tone = 'info',
  children
}) {
  const t = tones[tone] || tones.info;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 10,
      background: t.bg,
      color: t.fg,
      fontFamily: 'var(--font-body)',
      fontSize: 'var(--fs-body-sm)',
      fontWeight: 'var(--fw-medium)',
      padding: '12px 16px',
      borderRadius: 'var(--radius-md)',
      boxShadow: 'var(--shadow-md)'
    }
  }, children);
}
Object.assign(__ds_scope, { Toast });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/core/Toast.jsx", error: String((e && e.message) || e) }); }

// components/forms/Checkbox.jsx
try { (() => {
function Checkbox({
  label,
  checked,
  onChange
}) {
  return /*#__PURE__*/React.createElement("label", {
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      gap: 10,
      cursor: 'pointer',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      width: 20,
      height: 20,
      borderRadius: 6,
      flexShrink: 0,
      border: checked ? 'none' : '1.5px solid var(--border-strong)',
      background: checked ? 'var(--color-brand)' : 'var(--surface-card)',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      transition: 'all var(--dur-fast) var(--ease-standard)'
    }
  }, checked && /*#__PURE__*/React.createElement("svg", {
    width: "12",
    height: "10",
    viewBox: "0 0 12 10",
    fill: "none"
  }, /*#__PURE__*/React.createElement("path", {
    d: "M1 5L4.5 8.5L11 1",
    stroke: "white",
    strokeWidth: "2",
    strokeLinecap: "round",
    strokeLinejoin: "round"
  }))), /*#__PURE__*/React.createElement("input", {
    type: "checkbox",
    checked: checked,
    onChange: onChange,
    style: {
      display: 'none'
    }
  }), label && /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 'var(--fs-body-md)',
      color: 'var(--text-primary)'
    }
  }, label));
}
Object.assign(__ds_scope, { Checkbox });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Checkbox.jsx", error: String((e && e.message) || e) }); }

// components/forms/Input.jsx
try { (() => {
const {
  useState
} = React;
function Input({
  label,
  placeholder,
  type = 'text',
  icon,
  error,
  value,
  onChange,
  disabled
}) {
  const [focused, setFocused] = useState(false);
  return /*#__PURE__*/React.createElement("label", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 6,
      fontFamily: 'var(--font-body)',
      width: '100%'
    }
  }, label && /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 'var(--fs-body-sm)',
      fontWeight: 'var(--fw-medium)',
      color: 'var(--text-secondary)'
    }
  }, label), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 8,
      border: `1.5px solid ${error ? 'var(--status-rejected-dot)' : focused ? 'var(--focus-ring)' : 'var(--border-default)'}`,
      borderRadius: 'var(--radius-md)',
      padding: '10px 14px',
      background: disabled ? 'var(--gray-50)' : 'var(--surface-card)',
      boxShadow: focused ? '0 0 0 3px rgba(41,171,226,0.15)' : 'none',
      transition: 'all var(--dur-fast) var(--ease-standard)'
    }
  }, icon, /*#__PURE__*/React.createElement("input", {
    type: type,
    placeholder: placeholder,
    value: value,
    disabled: disabled,
    onChange: onChange,
    onFocus: () => setFocused(true),
    onBlur: () => setFocused(false),
    style: {
      border: 'none',
      outline: 'none',
      flex: 1,
      fontSize: 'var(--fs-body-md)',
      color: 'var(--text-primary)',
      background: 'transparent',
      fontFamily: 'inherit'
    }
  })), error && /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 'var(--fs-caption)',
      color: 'var(--status-rejected-fg)'
    }
  }, error));
}
Object.assign(__ds_scope, { Input });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Input.jsx", error: String((e && e.message) || e) }); }

// components/forms/Select.jsx
try { (() => {
function Select({
  label,
  options = [],
  value,
  onChange
}) {
  return /*#__PURE__*/React.createElement("label", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 6,
      fontFamily: 'var(--font-body)',
      width: '100%'
    }
  }, label && /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 'var(--fs-body-sm)',
      fontWeight: 'var(--fw-medium)',
      color: 'var(--text-secondary)'
    }
  }, label), /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'relative'
    }
  }, /*#__PURE__*/React.createElement("select", {
    value: value,
    onChange: onChange,
    style: {
      width: '100%',
      appearance: 'none',
      border: '1.5px solid var(--border-default)',
      borderRadius: 'var(--radius-md)',
      padding: '10px 34px 10px 14px',
      fontSize: 'var(--fs-body-md)',
      color: 'var(--text-primary)',
      background: 'var(--surface-card)',
      fontFamily: 'inherit',
      cursor: 'pointer'
    }
  }, options.map(o => /*#__PURE__*/React.createElement("option", {
    key: o,
    value: o
  }, o))), /*#__PURE__*/React.createElement("span", {
    style: {
      position: 'absolute',
      right: 14,
      top: '50%',
      transform: 'translateY(-50%)',
      pointerEvents: 'none',
      color: 'var(--text-muted)'
    }
  }, "\u25BE")));
}
Object.assign(__ds_scope, { Select });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Select.jsx", error: String((e && e.message) || e) }); }

// components/forms/Switch.jsx
try { (() => {
function Switch({
  checked,
  onChange,
  label
}) {
  return /*#__PURE__*/React.createElement("label", {
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      gap: 10,
      cursor: 'pointer',
      fontFamily: 'var(--font-body)'
    }
  }, label && /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 'var(--fs-body-md)',
      color: 'var(--text-primary)'
    }
  }, label), /*#__PURE__*/React.createElement("span", {
    onClick: onChange,
    style: {
      width: 42,
      height: 24,
      borderRadius: 'var(--radius-pill)',
      padding: 3,
      display: 'flex',
      background: checked ? 'var(--color-brand)' : 'var(--gray-300)',
      transition: 'background var(--dur-normal) var(--ease-standard)'
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      width: 18,
      height: 18,
      borderRadius: '50%',
      background: '#fff',
      boxShadow: 'var(--shadow-sm)',
      transform: checked ? 'translateX(18px)' : 'translateX(0)',
      transition: 'transform var(--dur-normal) var(--ease-standard)'
    }
  })));
}
Object.assign(__ds_scope, { Switch });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Switch.jsx", error: String((e && e.message) || e) }); }

// components/navigation/BottomNav.jsx
try { (() => {
const icons = {
  home: a => /*#__PURE__*/React.createElement("svg", {
    width: "22",
    height: "22",
    viewBox: "0 0 24 24",
    fill: "none"
  }, /*#__PURE__*/React.createElement("path", {
    d: "M4 11.5L12 4l8 7.5V20a1 1 0 01-1 1h-4v-6H9v6H5a1 1 0 01-1-1v-8.5z",
    stroke: a ? 'var(--color-brand)' : 'var(--text-muted)',
    strokeWidth: "1.8",
    strokeLinejoin: "round"
  })),
  policies: a => /*#__PURE__*/React.createElement("svg", {
    width: "22",
    height: "22",
    viewBox: "0 0 24 24",
    fill: "none"
  }, /*#__PURE__*/React.createElement("path", {
    d: "M6 3h9l4 4v13a1 1 0 01-1 1H6a1 1 0 01-1-1V4a1 1 0 011-1z",
    stroke: a ? 'var(--color-brand)' : 'var(--text-muted)',
    strokeWidth: "1.8"
  }), /*#__PURE__*/React.createElement("path", {
    d: "M9 12h6M9 16h6",
    stroke: a ? 'var(--color-brand)' : 'var(--text-muted)',
    strokeWidth: "1.8",
    strokeLinecap: "round"
  })),
  claims: a => /*#__PURE__*/React.createElement("svg", {
    width: "22",
    height: "22",
    viewBox: "0 0 24 24",
    fill: "none"
  }, /*#__PURE__*/React.createElement("path", {
    d: "M12 2l2.6 5.3 5.9.9-4.2 4.1 1 5.8-5.3-2.8-5.3 2.8 1-5.8-4.2-4.1 5.9-.9L12 2z",
    stroke: a ? 'var(--color-brand)' : 'var(--text-muted)',
    strokeWidth: "1.8",
    strokeLinejoin: "round"
  })),
  profile: a => /*#__PURE__*/React.createElement("svg", {
    width: "22",
    height: "22",
    viewBox: "0 0 24 24",
    fill: "none"
  }, /*#__PURE__*/React.createElement("circle", {
    cx: "12",
    cy: "8",
    r: "3.5",
    stroke: a ? 'var(--color-brand)' : 'var(--text-muted)',
    strokeWidth: "1.8"
  }), /*#__PURE__*/React.createElement("path", {
    d: "M4.5 20c1.2-3.8 4.2-5.5 7.5-5.5s6.3 1.7 7.5 5.5",
    stroke: a ? 'var(--color-brand)' : 'var(--text-muted)',
    strokeWidth: "1.8",
    strokeLinecap: "round"
  }))
};
function BottomNav({
  active = 'home',
  onChange
}) {
  const items = [{
    key: 'home',
    label: 'Home'
  }, {
    key: 'policies',
    label: 'Policies'
  }, {
    key: 'claims',
    label: 'Claims'
  }, {
    key: 'profile',
    label: 'Profile'
  }];
  return /*#__PURE__*/React.createElement("div", {
    style: {
      padding: '8px 16px calc(8px + env(safe-area-inset-bottom))',
      background: 'var(--surface-page)'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-around',
      alignItems: 'center',
      background: 'var(--surface-card)',
      borderRadius: 28,
      boxShadow: 'var(--shadow-md)',
      padding: 8,
      fontFamily: 'var(--font-body)'
    }
  }, items.map(it => {
    const a = it.key === active;
    return /*#__PURE__*/React.createElement("button", {
      key: it.key,
      onClick: () => onChange && onChange(it.key),
      style: {
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        gap: 3,
        background: a ? 'var(--color-brand-soft)' : 'none',
        border: 'none',
        cursor: 'pointer',
        padding: '6px 10px',
        borderRadius: 20
      }
    }, icons[it.key](a), /*#__PURE__*/React.createElement("span", {
      style: {
        fontSize: 'var(--fs-micro)',
        fontWeight: a ? 'var(--fw-semibold)' : 'var(--fw-medium)',
        color: a ? 'var(--color-brand)' : 'var(--text-muted)'
      }
    }, it.label));
  })));
}
Object.assign(__ds_scope, { BottomNav });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/navigation/BottomNav.jsx", error: String((e && e.message) || e) }); }

// components/navigation/TopBar.jsx
try { (() => {
function TopBar({
  title,
  dark = false,
  onBack,
  right
}) {
  return /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      gap: 12,
      background: dark ? 'var(--surface-dark)' : 'var(--surface-card)',
      padding: '16px 20px',
      fontFamily: 'var(--font-body)',
      borderBottom: dark ? 'none' : '1px solid var(--border-default)'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 10
    }
  }, onBack && /*#__PURE__*/React.createElement("button", {
    onClick: onBack,
    style: {
      background: 'none',
      border: 'none',
      cursor: 'pointer',
      padding: 0,
      color: dark ? '#fff' : 'var(--text-primary)'
    }
  }, /*#__PURE__*/React.createElement("svg", {
    width: "20",
    height: "20",
    viewBox: "0 0 24 24",
    fill: "none"
  }, /*#__PURE__*/React.createElement("path", {
    d: "M15 5l-7 7 7 7",
    stroke: "currentColor",
    strokeWidth: "2",
    strokeLinecap: "round",
    strokeLinejoin: "round"
  }))), /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 'var(--fs-title-sm)',
      fontWeight: 'var(--fw-bold)',
      color: dark ? '#fff' : 'var(--text-primary)'
    }
  }, title)), right);
}
Object.assign(__ds_scope, { TopBar });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/navigation/TopBar.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/ClaimDetailScreen.jsx
try { (() => {
function ClaimDetailScreen({
  nav,
  data
}) {
  const {
    TopBar,
    Card,
    StatusBadge,
    Toast
  } = window.OasisDesignSystem_6d12e0;
  const c = data || {};
  const steps = ['Submitted', 'Under Review', 'Approved', 'Invoiced'];
  const activeIdx = c.status === 'invoiced' ? 3 : c.status === 'closed' ? 2 : c.status === 'rejected' ? 1 : 1;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-page)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement(TopBar, {
    title: "Claim Details",
    onBack: () => nav('claims')
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflowY: 'auto',
      padding: 16,
      display: 'flex',
      flexDirection: 'column',
      gap: 14
    }
  }, /*#__PURE__*/React.createElement(Card, null, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      marginBottom: 8
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontWeight: 'var(--fw-bold)',
      fontSize: 16,
      color: 'var(--text-primary)'
    }
  }, c.line), /*#__PURE__*/React.createElement(StatusBadge, {
    status: c.status
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 12,
      color: 'var(--text-muted)'
    }
  }, c.id), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 20,
      fontWeight: 'var(--fw-bold)',
      color: 'var(--color-brand)',
      marginTop: 8
    }
  }, c.amount)), /*#__PURE__*/React.createElement(Card, null, /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 13,
      fontWeight: 'var(--fw-semibold)',
      color: 'var(--text-secondary)',
      marginBottom: 12
    }
  }, "Progress"), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 0
    }
  }, steps.map((s, i) => /*#__PURE__*/React.createElement("div", {
    key: s,
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 10
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      width: 12,
      height: 12,
      borderRadius: '50%',
      background: i <= activeIdx ? 'var(--color-brand)' : 'var(--gray-200)'
    }
  }), i < steps.length - 1 && /*#__PURE__*/React.createElement("div", {
    style: {
      width: 2,
      height: 24,
      background: i < activeIdx ? 'var(--color-brand)' : 'var(--gray-200)'
    }
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 13,
      color: i <= activeIdx ? 'var(--text-primary)' : 'var(--text-muted)',
      fontWeight: i === activeIdx ? 'var(--fw-semibold)' : 'var(--fw-regular)',
      paddingBottom: 12
    }
  }, s))))), c.status === 'rejected' && /*#__PURE__*/React.createElement(Toast, {
    tone: "error"
  }, "This claim was rejected. Contact your broker for details."), c.status === 'invoiced' && /*#__PURE__*/React.createElement(Toast, {
    tone: "success"
  }, "Claim approved and invoiced.")));
}
window.ClaimDetailScreen = ClaimDetailScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/ClaimDetailScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/ClaimsScreen.jsx
try { (() => {
function ClaimsScreen({
  nav
}) {
  const {
    TopBar,
    Card,
    StatusBadge,
    Button,
    BottomNav
  } = window.OasisDesignSystem_6d12e0;
  const {
    MOCK
  } = window;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-page)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement(TopBar, {
    title: "Claims",
    right: /*#__PURE__*/React.createElement(Button, {
      size: "sm",
      onClick: () => nav('submitClaim')
    }, "+ New")
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflowY: 'auto',
      padding: 16,
      display: 'flex',
      flexDirection: 'column',
      gap: 12
    }
  }, MOCK.claims.map(c => /*#__PURE__*/React.createElement(Card, {
    key: c.id,
    onClick: () => nav('claimDetail', c)
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'flex-start'
    }
  }, /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement("div", {
    style: {
      fontWeight: 'var(--fw-semibold)',
      fontSize: 14,
      color: 'var(--text-primary)'
    }
  }, c.line), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 12,
      color: 'var(--text-muted)',
      marginTop: 2
    }
  }, c.id)), /*#__PURE__*/React.createElement(StatusBadge, {
    status: c.status
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      marginTop: 8,
      fontSize: 13,
      fontWeight: 'var(--fw-medium)',
      color: 'var(--text-primary)'
    }
  }, c.amount)))), /*#__PURE__*/React.createElement(BottomNav, {
    active: "claims",
    onChange: k => nav(k)
  }));
}
window.ClaimsScreen = ClaimsScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/ClaimsScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/HomeScreen.jsx
try { (() => {
function HomeScreen({
  nav
}) {
  const {
    TopBar,
    Card,
    StatusBadge,
    Button,
    BottomNav
  } = window.OasisDesignSystem_6d12e0;
  const {
    MOCK
  } = window;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-page)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement(TopBar, {
    title: "Oasis",
    dark: true,
    right: /*#__PURE__*/React.createElement("span", {
      style: {
        color: '#fff',
        fontSize: 12,
        opacity: 0.8
      }
    }, "Ahmed Al-Otaibi")
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflowY: 'auto',
      padding: 16,
      display: 'flex',
      flexDirection: 'column',
      gap: 14
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      background: 'linear-gradient(135deg, var(--navy-800), var(--blue-600))',
      borderRadius: 'var(--radius-lg)',
      padding: 18,
      color: '#fff'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 12,
      color: 'var(--text-on-dark-muted)',
      marginBottom: 4
    }
  }, "Active Policies"), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 28,
      fontWeight: 800
    }
  }, "3"), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 12,
      marginTop: 8,
      color: 'var(--text-on-dark-muted)'
    }
  }, "1 renewal due in 11 days")), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 10
    }
  }, /*#__PURE__*/React.createElement(Button, {
    full: true,
    size: "sm",
    onClick: () => nav('claims')
  }, "Submit a Claim"), /*#__PURE__*/React.createElement(Button, {
    full: true,
    size: "sm",
    variant: "secondary",
    onClick: () => nav('policies')
  }, "View Policies")), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 'var(--fs-title-sm)',
      fontWeight: 'var(--fw-bold)',
      color: 'var(--text-primary)',
      marginTop: 4
    }
  }, "Recent Claims"), MOCK.claims.slice(0, 3).map(c => /*#__PURE__*/React.createElement(Card, {
    key: c.id,
    onClick: () => nav('claimDetail', c)
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'flex-start'
    }
  }, /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement("div", {
    style: {
      fontWeight: 'var(--fw-semibold)',
      fontSize: 14,
      color: 'var(--text-primary)'
    }
  }, c.line), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 12,
      color: 'var(--text-muted)',
      marginTop: 2
    }
  }, c.id, " \xB7 ", c.amount)), /*#__PURE__*/React.createElement(StatusBadge, {
    status: c.status
  }))))), /*#__PURE__*/React.createElement(BottomNav, {
    active: "home",
    onChange: k => nav(k)
  }));
}
window.HomeScreen = HomeScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/HomeScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/LoginScreen.jsx
try { (() => {
function LoginScreen({
  onLogin
}) {
  const {
    Button,
    Input
  } = window.OasisDesignSystem_6d12e0;
  const [id, setId] = React.useState('');
  const [pass, setPass] = React.useState('');
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-dark)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      gap: 20,
      padding: '0 28px'
    }
  }, /*#__PURE__*/React.createElement("img", {
    src: "../../assets/logo-full.png",
    style: {
      height: 44
    }
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      color: 'var(--text-on-dark-muted)',
      fontSize: 14,
      textAlign: 'center'
    }
  }, "Policy management & claims, in your pocket.")), /*#__PURE__*/React.createElement("div", {
    style: {
      background: 'var(--surface-card)',
      borderRadius: '24px 24px 0 0',
      padding: '28px 24px 32px',
      display: 'flex',
      flexDirection: 'column',
      gap: 16
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 'var(--fs-title-lg)',
      fontWeight: 'var(--fw-bold)',
      color: 'var(--text-primary)'
    }
  }, "Welcome back"), /*#__PURE__*/React.createElement(Input, {
    label: "National ID / Iqama",
    placeholder: "1xxxxxxxxx",
    value: id,
    onChange: e => setId(e.target.value)
  }), /*#__PURE__*/React.createElement(Input, {
    label: "Password",
    type: "password",
    placeholder: "\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022",
    value: pass,
    onChange: e => setPass(e.target.value)
  }), /*#__PURE__*/React.createElement(Button, {
    full: true,
    onClick: onLogin
  }, "Sign In"), /*#__PURE__*/React.createElement("div", {
    style: {
      textAlign: 'center',
      fontSize: 13,
      color: 'var(--text-muted)'
    }
  }, "Forgot password?")));
}
window.LoginScreen = LoginScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/LoginScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/PoliciesScreen.jsx
try { (() => {
function PoliciesScreen({
  nav
}) {
  const {
    TopBar,
    Card,
    StatusBadge,
    Tag,
    BottomNav
  } = window.OasisDesignSystem_6d12e0;
  const {
    MOCK
  } = window;
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-page)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement(TopBar, {
    title: "My Policies"
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflowY: 'auto',
      padding: 16,
      display: 'flex',
      flexDirection: 'column',
      gap: 12
    }
  }, MOCK.policies.map(p => /*#__PURE__*/React.createElement(Card, {
    key: p.id,
    onClick: () => nav('policyDetail', p)
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'flex-start',
      marginBottom: 8
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontWeight: 'var(--fw-semibold)',
      fontSize: 14,
      color: 'var(--text-primary)'
    }
  }, p.line), /*#__PURE__*/React.createElement(StatusBadge, {
    status: p.status
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 12,
      color: 'var(--text-muted)',
      marginBottom: 8
    }
  }, p.id), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement(Tag, {
    tone: "brand"
  }, "Expires ", p.expiry))))), /*#__PURE__*/React.createElement(BottomNav, {
    active: "policies",
    onChange: k => nav(k)
  }));
}
window.PoliciesScreen = PoliciesScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/PoliciesScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/PolicyDetailScreen.jsx
try { (() => {
function PolicyDetailScreen({
  nav,
  data
}) {
  const {
    TopBar,
    Card,
    StatusBadge,
    Tag,
    Button
  } = window.OasisDesignSystem_6d12e0;
  const p = data || {};
  const rows = [['Policy Number', p.id], ['Class of Business', p.line], ['Branch', 'Jeddah'], ['Effective Date', '25-Dec-2025'], ['Expiry Date', p.expiry], ['Premium', 'SAR 18,400']];
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-page)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement(TopBar, {
    title: "Policy Details",
    onBack: () => nav('policies')
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflowY: 'auto',
      padding: 16,
      display: 'flex',
      flexDirection: 'column',
      gap: 14
    }
  }, /*#__PURE__*/React.createElement(Card, null, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      marginBottom: 6
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      fontWeight: 'var(--fw-bold)',
      fontSize: 16,
      color: 'var(--text-primary)'
    }
  }, p.line), /*#__PURE__*/React.createElement(StatusBadge, {
    status: p.status
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 8,
      marginTop: 10
    }
  }, rows.map(([k, v]) => /*#__PURE__*/React.createElement("div", {
    key: k,
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      fontSize: 13
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      color: 'var(--text-muted)'
    }
  }, k), /*#__PURE__*/React.createElement("span", {
    style: {
      color: 'var(--text-primary)',
      fontWeight: 'var(--fw-medium)'
    }
  }, v))))), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      gap: 8
    }
  }, /*#__PURE__*/React.createElement(Tag, null, "Motor"), /*#__PURE__*/React.createElement(Tag, {
    tone: "brand"
  }, "Fleet")), /*#__PURE__*/React.createElement(Button, {
    full: true,
    onClick: () => nav('claims')
  }, "File a Claim on this Policy")));
}
window.PolicyDetailScreen = PolicyDetailScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/PolicyDetailScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/ProfileScreen.jsx
try { (() => {
function ProfileScreen({
  nav
}) {
  const {
    TopBar,
    Card,
    Switch,
    Button,
    BottomNav
  } = window.OasisDesignSystem_6d12e0;
  const [notifs, setNotifs] = React.useState(true);
  const [arabic, setArabic] = React.useState(false);
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-page)',
      fontFamily: 'var(--font-body)'
    }
  }, /*#__PURE__*/React.createElement(TopBar, {
    title: "Profile"
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflowY: 'auto',
      padding: 16,
      display: 'flex',
      flexDirection: 'column',
      gap: 14
    }
  }, /*#__PURE__*/React.createElement(Card, null, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 12
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      width: 48,
      height: 48,
      borderRadius: '50%',
      background: 'var(--color-brand)',
      color: '#fff',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      fontWeight: 700,
      fontSize: 18
    }
  }, "AO"), /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement("div", {
    style: {
      fontWeight: 'var(--fw-bold)',
      fontSize: 15,
      color: 'var(--text-primary)'
    }
  }, "Ahmed Al-Otaibi"), /*#__PURE__*/React.createElement("div", {
    style: {
      fontSize: 12,
      color: 'var(--text-muted)'
    }
  }, "ID \u2022\u2022\u2022\u2022 4821")))), /*#__PURE__*/React.createElement(Card, null, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 16
    }
  }, /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 14,
      color: 'var(--text-primary)'
    }
  }, "Push notifications"), /*#__PURE__*/React.createElement(Switch, {
    checked: notifs,
    onChange: () => setNotifs(v => !v)
  })), /*#__PURE__*/React.createElement("div", {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }
  }, /*#__PURE__*/React.createElement("span", {
    style: {
      fontSize: 14,
      color: 'var(--text-primary)'
    }
  }, "Arabic interface"), /*#__PURE__*/React.createElement(Switch, {
    checked: arabic,
    onChange: () => setArabic(v => !v)
  })))), /*#__PURE__*/React.createElement(Button, {
    variant: "secondary",
    full: true
  }, "Sign Out")), /*#__PURE__*/React.createElement(BottomNav, {
    active: "profile",
    onChange: k => nav(k)
  }));
}
window.ProfileScreen = ProfileScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/ProfileScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/SubmitClaimScreen.jsx
try { (() => {
function SubmitClaimScreen({
  nav
}) {
  const {
    TopBar,
    Input,
    Select,
    Button,
    Dialog
  } = window.OasisDesignSystem_6d12e0;
  const [open, setOpen] = React.useState(false);
  return /*#__PURE__*/React.createElement("div", {
    style: {
      height: '100%',
      display: 'flex',
      flexDirection: 'column',
      background: 'var(--surface-page)',
      fontFamily: 'var(--font-body)',
      position: 'relative'
    }
  }, /*#__PURE__*/React.createElement(TopBar, {
    title: "Submit a Claim",
    onBack: () => nav('claims')
  }), /*#__PURE__*/React.createElement("div", {
    style: {
      flex: 1,
      overflowY: 'auto',
      padding: 16,
      display: 'flex',
      flexDirection: 'column',
      gap: 16
    }
  }, /*#__PURE__*/React.createElement(Select, {
    label: "Policy",
    options: ['SL-RUH-MOT-2026-0044 — Motor Fleet', 'SL-RUH-GEN-2026-1090 — Property']
  }), /*#__PURE__*/React.createElement(Select, {
    label: "Claim Type",
    options: ['Motor — Accident', 'Motor — Theft', 'Property — Fire', 'Medical — Outpatient']
  }), /*#__PURE__*/React.createElement(Input, {
    label: "Incident Date",
    type: "date"
  }), /*#__PURE__*/React.createElement(Input, {
    label: "Estimated Amount (SAR)",
    placeholder: "0.00"
  }), /*#__PURE__*/React.createElement(Input, {
    label: "Description",
    placeholder: "Briefly describe what happened"
  }), /*#__PURE__*/React.createElement(Button, {
    full: true,
    onClick: () => setOpen(true)
  }, "Submit Claim")), /*#__PURE__*/React.createElement(Dialog, {
    open: open,
    title: "Submit Claim?",
    onClose: () => setOpen(false),
    actions: /*#__PURE__*/React.createElement(React.Fragment, null, /*#__PURE__*/React.createElement(Button, {
      variant: "secondary",
      full: true,
      onClick: () => setOpen(false)
    }, "Cancel"), /*#__PURE__*/React.createElement(Button, {
      full: true,
      onClick: () => {
        setOpen(false);
        nav('claims');
      }
    }, "Confirm"))
  }, "Your claim will be sent to Oasis IMS for review. You'll be notified once it's assessed."));
}
window.SubmitClaimScreen = SubmitClaimScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/SubmitClaimScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/mobile-app/mockData.js
try { (() => {
const policies = [{
  id: 'SL-RUH-MOT-2026-0044',
  line: 'Motor Comprehensive Fleet',
  status: 'closed',
  expiry: '24-Dec-2026'
}, {
  id: 'SL-RUH-GEN-2026-1090',
  line: 'Property All Risks',
  status: 'pending',
  expiry: '16-Aug-2026'
}, {
  id: 'SL-JED-MED-2026-0231',
  line: 'Medical — Group',
  status: 'processing',
  expiry: '02-Sep-2026'
}];
const claims = [{
  id: 'CLM-2026-3381',
  line: 'Motor Third Party Liability',
  status: 'invoiced',
  amount: 'SAR 4,250'
}, {
  id: 'CLM-2026-3402',
  line: 'Medical — Outpatient',
  status: 'pending',
  amount: 'SAR 890'
}, {
  id: 'CLM-2026-3299',
  line: 'Property Fire',
  status: 'rejected',
  amount: 'SAR 12,000'
}, {
  id: 'CLM-2026-3160',
  line: 'Motor Comprehensive',
  status: 'closed',
  amount: 'SAR 6,700'
}];
window.MOCK = {
  policies,
  claims
};
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/mobile-app/mockData.js", error: String((e && e.message) || e) }); }

__ds_ns.Button = __ds_scope.Button;

__ds_ns.Card = __ds_scope.Card;

__ds_ns.Dialog = __ds_scope.Dialog;

__ds_ns.StatusBadge = __ds_scope.StatusBadge;

__ds_ns.Tabs = __ds_scope.Tabs;

__ds_ns.Tag = __ds_scope.Tag;

__ds_ns.Toast = __ds_scope.Toast;

__ds_ns.Checkbox = __ds_scope.Checkbox;

__ds_ns.Input = __ds_scope.Input;

__ds_ns.Select = __ds_scope.Select;

__ds_ns.Switch = __ds_scope.Switch;

__ds_ns.BottomNav = __ds_scope.BottomNav;

__ds_ns.TopBar = __ds_scope.TopBar;

})();
