/*
 * DLX WHMCS Admin Theme — interactions
 */
(function(){

const root = document.documentElement;

/* ── Helpers ── */
function el(id) { return document.getElementById(id); }
function qs(sel) { return document.querySelector(sel); }
function qsa(sel) { return document.querySelectorAll(sel); }
function on(id, ev, fn) { const e = el(id); if (e) e.addEventListener(ev, fn); }

/* ── Restore saved theme/accent on every page load ── */
const savedTheme  = localStorage.getItem('dlxTheme')     || 'dark';
const savedAccent = localStorage.getItem('dlxAccent')    || '#2e7cf6';
const savedInk    = localStorage.getItem('dlxAccentInk') || '#ffffff';
root.setAttribute('data-theme', savedTheme);
root.style.setProperty('--accent', savedAccent);
root.style.setProperty('--accent-ink', savedInk);

/* ── THEME TOGGLE ── */
function setTheme(t) {
  root.setAttribute('data-theme', t);
  localStorage.setItem('dlxTheme', t);
  qsa('#themeSeg button').forEach(b => b.classList.toggle('on', b.dataset.v === t));
  drawCharts();
}
on('themeBtn', 'click', () => setTheme(root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark'));
qsa('#themeSeg button').forEach(b => b.addEventListener('click', () => setTheme(b.dataset.v)));

/* ── ACCENT ── */
function setAccent(hex, ink) {
  root.style.setProperty('--accent', hex);
  root.style.setProperty('--accent-ink', ink);
  localStorage.setItem('dlxAccent', hex);
  localStorage.setItem('dlxAccentInk', ink);
  qsa('#accentSwatches button').forEach(b => b.classList.toggle('on', b.dataset.v === hex));
  // sync swatch UI state with saved value
  qsa('#accentSwatches button').forEach(b => b.classList.toggle('on', b.dataset.v === hex));
  drawCharts();
}
// Set active swatch on load
qsa('#accentSwatches button').forEach(b => {
  b.classList.toggle('on', b.dataset.v === savedAccent);
  b.addEventListener('click', () => setAccent(b.dataset.v, b.dataset.ink));
});

/* ── TWEAKS PANEL ── */
on('tweakBtn', 'click', () => { const t = el('tw'); if(t) t.classList.toggle('on'); });
on('twClose',  'click', () => { const t = el('tw'); if(t) t.classList.remove('on'); });

/* ── + ADD NEW flyout in topbar ── */
$(document).ready(function() {
    $('#topbarAddNew').on('click', function(e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        var $menu = $('#topbarAddNewMenu');
        
        // закрываем все другие меню, если есть
        $('.topbar-addnew-menu').not($menu).hide();
        
        // переключаем текущее
        $menu.toggle();
    });

    // закрываем меню при клике вне его
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#topbarAddNewWrap').length) {
            $('#topbarAddNewMenu').hide();
        }
    });
});

/* ── SIDEBAR MINIMIZE ── */
document.addEventListener('DOMContentLoaded', function() {
    const app       = document.querySelector('.app');
    const sidebar   = document.getElementById('sidebar');
    const body      = document.body;
    const expandBtn = document.getElementById('sidebarExpand');

    if (!app || !sidebar) return;

     function restoreState() {
        const isMinimized = localStorage.getItem('sidebarMinimized') === 'true';

        if (isMinimized) {
            body.classList.add('side-min');
            app.style.gridTemplateColumns = '64px 1fr';
            sidebar.style.display = 'none';
            if (expandBtn) expandBtn.style.display = 'flex';
        } else {
            body.classList.remove('side-min');
            app.style.gridTemplateColumns = '64px 240px 1fr';
            sidebar.style.display = 'block';
            if (expandBtn) expandBtn.style.display = 'none';
        }
    }

     window.toggleSidebar = function() {
        const isMinimized = body.classList.toggle('side-min');

        if (isMinimized) {
            app.style.gridTemplateColumns = '64px 1fr';
            sidebar.style.display = 'none';
            if (expandBtn) expandBtn.style.display = 'flex';
        } else {
            app.style.gridTemplateColumns = '64px 240px 1fr';
            sidebar.style.display = 'block';
            if (expandBtn) expandBtn.style.display = 'none';
        }

         localStorage.setItem('sidebarMinimized', isMinimized);
    };

     if (expandBtn) {
        expandBtn.addEventListener('click', function(e) {
            e.preventDefault();
             toggleSidebar();
        });
    }

     restoreState();
});

/* SEARCH */
$(document).ready(function() {
    const $input     = $('#inputIntelliSearchValue');
    const $form      = $input.closest('form');
    const $results   = $('#intelliSearchResults');
    const $loader    = $form.find('.loader');
    let timeout      = null;

     function buildIntelliResults(data) {
        let html = '';

        const types = {
            client:  'Clients',
            user:    'Users',
            contact: 'Contects',
            service: 'Services',
            domain:  'Domains',
            invoice: 'Invoices',
            ticket:  'Tickets',
            other:   'Other'
        };

        Object.keys(types).forEach(key => {
            const items = data[key] || [];
            if (items.length === 0) return;

            html += `<div class="intelli-section"><h5>${types[key]} (${items.length})</h5>`;

            items.forEach(item => {
                let link = '';
                let text = '';

                if (key === 'client') {
                    link = `/admin/clientssummary.php?userid=${item.id}`;
                    text = `${item.name} <small>${item.company_name !== '(Company Name)' ? item.company_name : ''}</small><br><small>${item.email}</small>`;
                }
                else if (key === 'user') {
                     link = item.link.replace(/href=\\?"/g, '').replace(/\\?"/g, '');
                    text = `${item.name}<br><small>${item.email}</small>`;
                }
                else if (item.link) {
                    link = item.link.replace(/href=\\?"/g, '').replace(/\\?"/g, '');
                    text = item.name || item.title || '—';
                }
                else {
                    return;
                }

                html += `
                    <a href="${link}" class="intelli-result-item">
                        ${text}
                    </a>`;
            });

            html += `</div>`;
        });

        if (!html) {
            return `<div class="intelli-no-results">Nothing found</div>`;
        }

        return html;
    }

    function performSearch() {
        const searchTerm = $.trim($input.val());

        if (searchTerm.length < 2) {
            $results.hide().html('');
            return;
        }

        $loader.addClass('active');

        $.ajax({
            url: $form.attr('action'),
            type: 'POST',
            data: $form.serialize(),
            dataType: 'json',  
            success: function(data) {
                const html = buildIntelliResults(data);
                $results.html(html).fadeIn(200);
            },
            error: function() {
                $results.html('<div class="alert alert-danger p-2">Search error</div>').show();
            },
            complete: function() {
                $loader.removeClass('active');
            }
        });
    }

     $input.on('input keyup', function() {
        clearTimeout(timeout);
        timeout = setTimeout(performSearch, 280);
    });

     $input.on('keydown', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            clearTimeout(timeout);
            performSearch();
        }
    });

     $('#btnIntelliSearchClose').on('click', function() {
        $results.hide().html('');
        $input.val('');
    });

     $(document).on('click', function(e) {
        if (!$(e.target).closest('#intelliSearchForm, #intelliSearchResults').length) {
            $results.hide();
        }
    });
});

/* ── CHARTS ── */
function getCss(v) { return getComputedStyle(root).getPropertyValue(v).trim(); }

function drawMultiArea(elId, series, opts={}) {
  const el = document.getElementById(elId);
  if (!el) return;
  el.innerHTML = '';
  const w = el.clientWidth || 600;
  const h = opts.height || 240;
  const pad = { l: 38, r: 14, t: 14, b: 28 };
  const allVals = series.flatMap(s => s.data.map(d => d.v));
  const max = Math.max(...allVals, 1);
  const labels = series[0].data.map(d => d.x);
  const xs = (i) => pad.l + (i/(labels.length-1)) * (w - pad.l - pad.r);
  const ys = (v) => pad.t + (1 - v/max) * (h - pad.t - pad.b);
  const line = getCss('--line');
  const ink3 = getCss('--ink-3');
  const svg = document.createElementNS('http://www.w3.org/2000/svg','svg');
  svg.setAttribute('viewBox', `0 0 ${w} ${h}`);
  svg.style.width = '100%'; svg.style.height = h + 'px';
  for (let i = 0; i <= 4; i++) {
    const y = pad.t + (i/4) * (h - pad.t - pad.b);
    const g = document.createElementNS('http://www.w3.org/2000/svg','line');
    g.setAttribute('x1', pad.l); g.setAttribute('x2', w - pad.r);
    g.setAttribute('y1', y); g.setAttribute('y2', y);
    g.setAttribute('stroke', line);
    if (i < 4) g.setAttribute('stroke-dasharray','2 4');
    svg.appendChild(g);
    const t = document.createElementNS('http://www.w3.org/2000/svg','text');
    t.setAttribute('x', 6); t.setAttribute('y', y + 4);
    t.setAttribute('font-family','Arial'); t.setAttribute('font-size','9'); t.setAttribute('fill', ink3);
    t.textContent = (max - (i/4)*max).toFixed(opts.dec || 0);
    svg.appendChild(t);
  }
  labels.forEach((lbl, i) => {
    if (i % (opts.xEvery || 4) === 0 || i === labels.length - 1) {
      const t = document.createElementNS('http://www.w3.org/2000/svg','text');
      t.setAttribute('x', xs(i)); t.setAttribute('y', h - 8);
      t.setAttribute('font-family','Arial'); t.setAttribute('font-size','9'); t.setAttribute('fill', ink3);
      t.setAttribute('text-anchor','middle');
      t.textContent = lbl;
      svg.appendChild(t);
    }
  });
  series.forEach((s) => {
    let d = '';
    s.data.forEach((p, i) => { d += (i===0?'M':'L') + xs(i) + ',' + ys(p.v); });
    const lp = document.createElementNS('http://www.w3.org/2000/svg','path');
    lp.setAttribute('d', d); lp.setAttribute('fill','none');
    lp.setAttribute('stroke', s.color); lp.setAttribute('stroke-width', 1.6);
    svg.appendChild(lp);
  });
  el.appendChild(svg);
}

function drawArea(elId, data, opts={}) {
  const el = document.getElementById(elId);
  if (!el) return;
  el.innerHTML = '';
  const w = el.clientWidth || 600;
  const h = opts.height || 220;
  const pad = { l: 38, r: 14, t: 14, b: 28 };
  const max = Math.max(...data.map(d=>d.v));
  const min = Math.min(...data.map(d=>d.v));
  const range = max - min || 1;
  const xs = (i) => pad.l + (i/(data.length-1)) * (w - pad.l - pad.r);
  const ys = (v) => pad.t + (1 - (v-min)/range) * (h - pad.t - pad.b);
  const accent = getCss('--accent');
  const line = getCss('--line');
  const ink3 = getCss('--ink-3');
  const svg = document.createElementNS('http://www.w3.org/2000/svg','svg');
  svg.setAttribute('viewBox', `0 0 ${w} ${h}`);
  svg.style.width='100%'; svg.style.height = h + 'px';
  for (let i = 0; i <= 4; i++) {
    const y = pad.t + (i/4) * (h - pad.t - pad.b);
    const g = document.createElementNS('http://www.w3.org/2000/svg','line');
    g.setAttribute('x1', pad.l); g.setAttribute('x2', w - pad.r);
    g.setAttribute('y1', y); g.setAttribute('y2', y);
    g.setAttribute('stroke', line);
    if (i < 4) g.setAttribute('stroke-dasharray','2 4');
    svg.appendChild(g);
    const t = document.createElementNS('http://www.w3.org/2000/svg','text');
    t.setAttribute('x', 6); t.setAttribute('y', y + 4);
    t.setAttribute('font-family','Arial'); t.setAttribute('font-size','9'); t.setAttribute('fill', ink3);
    const val = max - (i/4)*range;
    t.textContent = opts.yFmt ? opts.yFmt(val) : Math.round(val);
    svg.appendChild(t);
  }
  data.forEach((d, i) => {
    if (i % (opts.xEvery || 5) === 0 || i === data.length - 1) {
      const t = document.createElementNS('http://www.w3.org/2000/svg','text');
      t.setAttribute('x', xs(i)); t.setAttribute('y', h - 8);
      t.setAttribute('font-family','Arial'); t.setAttribute('font-size','9'); t.setAttribute('fill', ink3);
      t.setAttribute('text-anchor','middle');
      t.textContent = d.x;
      svg.appendChild(t);
    }
  });
  const defs = document.createElementNS('http://www.w3.org/2000/svg','defs');
  const grad = document.createElementNS('http://www.w3.org/2000/svg','linearGradient');
  const gid = 'g_' + elId;
  grad.setAttribute('id', gid); grad.setAttribute('x1','0'); grad.setAttribute('x2','0'); grad.setAttribute('y1','0'); grad.setAttribute('y2','1');
  grad.innerHTML = `<stop offset="0%" stop-color="${accent}" stop-opacity="0.28"/><stop offset="100%" stop-color="${accent}" stop-opacity="0"/>`;
  defs.appendChild(grad); svg.appendChild(defs);
  let d = '';
  data.forEach((p,i) => { d += (i===0?'M':'L') + xs(i) + ',' + ys(p.v); });
  const area = d + ` L${xs(data.length-1)},${h-pad.b} L${xs(0)},${h-pad.b} Z`;
  const ap = document.createElementNS('http://www.w3.org/2000/svg','path');
  ap.setAttribute('d', area); ap.setAttribute('fill', `url(#${gid})`);
  svg.appendChild(ap);
  const lp = document.createElementNS('http://www.w3.org/2000/svg','path');
  lp.setAttribute('d', d); lp.setAttribute('fill','none');
  lp.setAttribute('stroke', accent); lp.setAttribute('stroke-width', 1.6);
  svg.appendChild(lp);
  el.appendChild(svg);
}

function drawBars(elId, data, opts={}) {
  const el = document.getElementById(elId);
  if (!el) return;
  el.innerHTML = '';
  const w = el.clientWidth || 600;
  const h = opts.height || 220;
  const pad = { l: 30, r: 10, t: 14, b: 28 };
  const max = Math.max(...data.map(d=>d.v));
  const accent = getCss('--accent');
  const ink2 = getCss('--ink-2');
  const ink3 = getCss('--ink-3');
  const line = getCss('--line');
  const svg = document.createElementNS('http://www.w3.org/2000/svg','svg');
  svg.setAttribute('viewBox', `0 0 ${w} ${h}`);
  svg.style.width = '100%'; svg.style.height = h + 'px';
  const innerW = w - pad.l - pad.r;
  const innerH = h - pad.t - pad.b;
  const barW = innerW / data.length * 0.6;
  const gap = innerW / data.length * 0.4;
  for (let i = 0; i <= 4; i++) {
    const y = pad.t + (i/4) * innerH;
    const g = document.createElementNS('http://www.w3.org/2000/svg','line');
    g.setAttribute('x1', pad.l); g.setAttribute('x2', w - pad.r);
    g.setAttribute('y1', y); g.setAttribute('y2', y);
    g.setAttribute('stroke', line);
    if (i < 4) g.setAttribute('stroke-dasharray','2 4');
    svg.appendChild(g);
  }
  data.forEach((d, i) => {
    const x = pad.l + i * (barW + gap) + gap/2;
    const bh = (d.v / max) * innerH;
    const y = pad.t + innerH - bh;
    const r = document.createElementNS('http://www.w3.org/2000/svg','rect');
    r.setAttribute('x', x); r.setAttribute('y', y);
    r.setAttribute('width', barW); r.setAttribute('height', bh);
    r.setAttribute('fill', i === data.length - 1 ? accent : ink2);
    r.setAttribute('opacity', i === data.length - 1 ? 1 : 0.55);
    svg.appendChild(r);
    if (i % (opts.xEvery || 5) === 0 || i === data.length - 1) {
      const t = document.createElementNS('http://www.w3.org/2000/svg','text');
      t.setAttribute('x', x + barW/2); t.setAttribute('y', h - 8);
      t.setAttribute('font-family','Arial'); t.setAttribute('font-size','9'); t.setAttribute('fill', ink3);
      t.setAttribute('text-anchor','middle');
      t.textContent = d.x;
      svg.appendChild(t);
    }
  });
  el.appendChild(svg);
}

function drawCharts() {
  requestAnimationFrame(() => {
    if (document.getElementById('overviewChart')) {
      const hours = ['12am','1am','2am','3am','4am','5am','6am','7am','8am','9am','10am','11am','12pm','1pm','2pm','3pm','4pm','5pm'];
      drawMultiArea('overviewChart', [
        { color: '#b8b8b8', data: hours.map((h,i) => ({x:h, v: i<8?0:Math.round(Math.sin(i/3)*3+Math.random()*3)})) },
        { color: getCss('--info'), data: hours.map((h,i) => ({x:h, v: i<9?0:Math.round(Math.sin(i/4)*2.5+Math.random()*2)})) },
        { color: getCss('--ok'),   data: hours.map((h,i) => ({x:h, v: i<9?0:Math.round(Math.sin(i/3)*4+Math.random()*4+2)})) }
      ], { xEvery: 2, dec: 1 });
    }
  });
}

window.addEventListener('resize', drawCharts);
drawCharts();

})();
