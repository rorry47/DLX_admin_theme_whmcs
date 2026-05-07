# DLX — WHMCS Admin Theme

A clean, modern admin theme for WHMCS 8.x / 9.x with dark and light modes, a blue accent colour, live IntelliSearch, and a fully self-contained file set.

<table style="width: 100%;">
  <tr>
    <td style="width: 33%; text-align: center;">
      <img src="https://github.com/rorry47/DLX_admin_theme_whmcs/blob/main/scrn_1.jpg"width="100%">
    </td>
    <td style="width: 33%; text-align: center;">
      <img src="https://github.com/rorry47/DLX_admin_theme_whmcs/blob/main/scrn_2.jpg" width="100%">
    </td>
    <td style="width: 33%; text-align: center;">
      <img src="https://github.com/rorry47/DLX_admin_theme_whmcs/blob/main/scrn_3.jpg" width="100%">
    </td>
  </tr>
</table>

---

## Preview

| Dark mode | Light mode |
|---|---|
| Dark background `#0e0e0e`, sidebar rail, blue accent | Warm off-white `#f2f2f0`, same layout |

---

## Requirements

- WHMCS **8.0** or newer (tested on 9.0.3)
- PHP 7.4+
- No additional dependencies — all vendor assets (Bootstrap, jQuery, FontAwesome) are bundled

---

## Installation

**1. Upload the theme folder**

Unzip the archive and upload the `DLX` folder to your server:

```
/path/to/whmcs/admin/templates/DLX/
```

The final structure should look like this:

```
admin/
└── templates/
    └── DLX/
        ├── css/
        │   ├── theme.css
        │   └── all.min.css
        ├── js/
        │   ├── scripts.js
        │   └── vendor.min.js
        ├── fonts/
        ├── images/
        ├── img/
        ├── affiliates/
        ├── header.tpl
        ├── footer.tpl
        ├── nav.tpl
        ├── sidebar.tpl
        ├── homepage.tpl
        └── ...
```

**2. Activate in WHMCS**

1. Log in to the WHMCS admin area
2. Go to **My Account** (top-right avatar) → **My Account**
3. In the **Template** dropdown select `DLX`
4. Click **Save Changes**

The new theme will apply immediately — no server restart required.

---

## Dark & Light Mode

The theme ships with two colour schemes that can be switched **without a page reload**.

### Switching the mode

Click the **moon icon** (☽) in the top-right toolbar to toggle between dark and light instantly.

Alternatively, open the **Tweaks panel** (palette icon in the toolbar) and use the `Dark / Light` segment control.

Your choice is saved to `localStorage` under the key `dlxTheme` and restored automatically on every page load — including after a session expiry or browser restart.

### Dark mode tokens

| Variable | Value | Used for |
|---|---|---|
| `--bg` | `#0e0e0e` | Page background |
| `--bg-1` | `#161616` | Cards, panels |
| `--bg-2` | `#1c1c1c` | Table headers, inputs |
| `--line` | `#262626` | Borders, dividers |
| `--ink` | `#ededed` | Primary text |

### Light mode tokens

| Variable | Value | Used for |
|---|---|---|
| `--bg` | `#f2f2f0` | Page background |
| `--bg-1` | `#ffffff` | Cards, panels |
| `--bg-2` | `#f0eee9` | Table headers, inputs |
| `--line` | `#e3e0d8` | Borders, dividers |
| `--ink` | `#1a1a1a` | Primary text |

---

## Accent Colour

The default accent is **blue `#2e7cf6`**. You can change it live from the Tweaks panel — six presets are available (blue, orange, green, purple, amber, white).

To change the default permanently, edit the first lines of `css/theme.css`:

```css
:root {
  --accent:     #2e7cf6;   /* ← your colour here  */
  --accent-ink: #ffffff;   /* ← text on top of it */
}
```

Your live selection is persisted in `localStorage` (`dlxAccent` / `dlxAccentInk`) and survives page reloads.

---

## IntelliSearch (Live Search)

IntelliSearch is WHMCS's built-in live search feature. DLX styles it to match the dark theme.

### How to use

1. Click the **magnifier icon** (🔍) in the top-right toolbar, or press the keyboard shortcut configured in your WHMCS settings
2. Start typing — results appear instantly as you type, grouped by category:
   - Clients
   - Orders
   - Invoices
   - Support Tickets
   - Products / Services
   - Domains
3. Click any result to navigate directly to that record

The search overlay slides down from the top bar and closes when you click outside it or press **Escape**.

> IntelliSearch requires the feature to be enabled in **Setup → General Settings → Other → IntelliSearch**.

---

## Quick-Add Menu ( + )

The **+** button in the top-left of the toolbar (next to the logo) opens a dropdown for creating new records without navigating away:

- Add New Client
- Add New Order
- Create Invoice
- Create Quote
- Open New Ticket

Only the actions your admin account has permission for are shown.

---

## File Reference

| File | Purpose |
|---|---|
| `header.tpl` | Page shell — topbar, icon rail, sidebar include |
| `footer.tpl` | Closing tags, tweaks panel, theme JS |
| `nav.tpl` | Top navigation bar (dropdown menus) |
| `sidebar.tpl` | Left contextual panel (shortcuts, search, staff) |
| `homepage.tpl` | Dashboard widget grid |
| `css/theme.css` | All custom styles and CSS variable definitions |
| `js/scripts.js` | Theme switching, accent picker, chart renderer |
| `js/vendor.min.js` | Bundled jQuery + Bootstrap (from WHMCS default theme) |

---

## Customisation

### Change the logo

Replace `images/logo.png` with your own file (recommended size: **160 × 40 px**, white/transparent background for dark mode).

Or edit the brand text directly in `header.tpl`:

```smarty
<div class="brand">//<span class="accent">.</span>yourname</div>
```

### Add your own CSS

Append rules to `css/theme.css`. All design tokens are available as CSS custom properties so you can do things like:

```css
/* Make sidebar links use a custom font size */
.dlx-panel .sidebar ul li a {
  font-size: 13px;
  color: var(--ink-1);
}
```

---

## Upgrading

1. Back up your current `DLX` folder
2. Upload the new version
3. Hard-refresh your browser (`Ctrl+Shift+R` / `Cmd+Shift+R`) to clear cached CSS/JS

Theme preferences (dark/light, accent colour) are stored in `localStorage` and will be preserved across upgrades.

---

## Troubleshooting

**Blank page or redirect loop after activating**
WHMCS validates the template folder name. Make sure the folder is named exactly `DLX` (case-sensitive) and is located at `admin/templates/DLX/`.

**Styles look like the default theme**
The browser may be serving a cached version. Press `Ctrl+Shift+R` to force a full reload. If the issue persists, check that `css/theme.css` is accessible at `yoursite.com/admin/templates/DLX/css/theme.css`.

**JavaScript error in console**
Make sure `js/vendor.min.js` is present and accessible. This file contains jQuery which is required by both WHMCS core and the theme scripts.

**IntelliSearch not working**
Enable it under **Setup → General Settings → Other → IntelliSearch Enabled**.

---

## Support

- PayPall: `lyjex.lyjex@gmail.com`
- Bitcoin [BTC]: `1JK1og8cLFJ7CvRL6Ff5fEN8gzMDpNJFMm`
- Ethereum [ERC20]: `0x1f332bcca1b6b04824d18d31e52d1a7613113e7c`
- TetherUS [TRC20]: `TMXgowg4cQb1iLUSeADcvGHfb4F8HsSw1m`

---
## License

This theme is provided as-is for personal and commercial use on a single WHMCS installation. Redistribution or resale is not permitted without written permission.
