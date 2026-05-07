{*
 * nkotov WHMCS Admin Theme — primary navigation rail (vertical, icon-only with tooltips)
 * Each <a class="ri"> highlights when its section is the current $sidebar value.
 *}

<a href="index.php" class="ri brand-ri{if $sidebar eq 'home'} active{/if}" title="{$_ADMINLANG.home.title}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2h-4v-7h-6v7H5a2 2 0 01-2-2z"/></svg>
    <span class="lbl">{$_ADMINLANG.home.title}</span>
</a>


<a href="clients.php" class="ri{if $sidebar eq 'clients'} active{/if}" title="{$_ADMINLANG.clients.title}">    
<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><circle cx="9" cy="8" r="4"/><path d="M2 21c0-3.9 3.1-7 7-7s7 3.1 7 7"/><circle cx="17" cy="7" r="3"/><path d="M22 19c0-2.5-2-4.5-4.5-4.5"/></svg>
    <span class="lbl">{$_ADMINLANG.clients.title}</span>
</a>

{if in_array("View Orders", $admin_perms)}
<a href="orders.php" class="ri{if $sidebar eq 'orders'} active{/if}" title="{$_ADMINLANG.orders.title}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M3 6h18l-2 12H5L3 6z"/><path d="M3 6L2 3H0"/><circle cx="9" cy="21" r="1"/><circle cx="17" cy="21" r="1"/></svg>
    <span class="lbl">{$_ADMINLANG.orders.title}</span>
</a>
{/if}

{if in_array("List Invoices", $admin_perms) || in_array("List Transactions", $admin_perms)}
<a href="invoices.php" class="ri{if $sidebar eq 'billing'} active{/if}" title="{$_ADMINLANG.billing.title}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="8" y1="13" x2="16" y2="13"/><line x1="8" y1="17" x2="13" y2="17"/></svg>
    <span class="lbl">{$_ADMINLANG.billing.title}</span>
</a>
{/if}

{if in_array("List Support Tickets", $admin_perms)}
<a href="supporttickets.php" class="ri{if $sidebar eq 'support'} active{/if}" title="{$_ADMINLANG.support.title}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg>
    <span class="lbl">{$_ADMINLANG.support.title}</span>
</a>
{/if}

{if in_array("View Reports", $admin_perms)}
<a href="reports.php" class="ri{if $sidebar eq 'reports'} active{/if}" title="{$_ADMINLANG.reports.title}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M3 3v18h18"/><polyline points="7 14 11 10 14 13 21 6"/></svg>
    <span class="lbl">{$_ADMINLANG.reports.title}</span>
</a>
{/if}

<a href="configproducts.php" class="ri{if $sidebar eq 'products'} active{/if}" title="{$_ADMINLANG.setup.products}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M21 16V8a2 2 0 00-1-1.7l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.7l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"/><polyline points="3.3 7 12 12 20.7 7"/><line x1="12" y1="22" x2="12" y2="12"/></svg>
    <span class="lbl">{$_ADMINLANG.setup.products}</span>
</a>

<a href="todolist.php" class="ri{if $sidebar eq 'utilities'} active{/if}" title="{$_ADMINLANG.utilities.title}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="9" y1="15" x2="15" y2="15"/><line x1="9" y1="11" x2="15" y2="11"/></svg>
    <span class="lbl">{$_ADMINLANG.utilities.title}</span>
</a>

{if !empty($addon_modules)}
<a href="addonmodules.php" class="ri{if $sidebar eq 'addonmodules'} active{/if}" title="{$_ADMINLANG.utilities.addonmodules}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
    <span class="lbl">{$_ADMINLANG.utilities.addonmodules}</span>
</a>
{/if}

<div class="rail-sep"></div>

{if !$isNewInstallation && ($isCronError || $isCronWarning) && in_array("Automation Status", $admin_perms)}
<a href="automationstatus.php" class="ri" title="{$_ADMINLANG.utilities.automationStatus}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.6 1.6 0 00.3 1.8l.1.1a2 2 0 11-2.8 2.8l-.1-.1a1.6 1.6 0 00-1.8-.3 1.6 1.6 0 00-1 1.5V21a2 2 0 11-4 0v-.1a1.6 1.6 0 00-1-1.5 1.6 1.6 0 00-1.8.3l-.1.1a2 2 0 11-2.8-2.8l.1-.1a1.6 1.6 0 00.3-1.8 1.6 1.6 0 00-1.5-1H3a2 2 0 110-4h.1a1.6 1.6 0 001.5-1 1.6 1.6 0 00-.3-1.8l-.1-.1a2 2 0 112.8-2.8l.1.1a1.6 1.6 0 001.8.3H9a1.6 1.6 0 001-1.5V3a2 2 0 114 0v.1a1.6 1.6 0 001 1.5 1.6 1.6 0 001.8-.3l.1-.1a2 2 0 112.8 2.8l-.1.1a1.6 1.6 0 00-.3 1.8V9a1.6 1.6 0 001.5 1H21a2 2 0 110 4h-.1a1.6 1.6 0 00-1.5 1z"/></svg>
    <span class="rail-badge">!</span>
    <span class="lbl">{$_ADMINLANG.utilities.automationStatus}</span>
</a>
{/if}

{if $showUpdateAvailable}
<a href="update.php" class="ri update-available" title="{$_ADMINLANG.license.updateavailable}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
    <span class="rail-badge accent">●</span>
    <span class="lbl">{$_ADMINLANG.license.updateavailable}</span>
</a>
{/if}

<a href="{routePath('admin-setup-index')}" class="ri{if $sidebar eq 'config'} active{/if}" title="{$_ADMINLANG.setup.config}">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M14.7 6.3a1 1 0 000 1.4l1.6 1.6a1 1 0 001.4 0l3.77-3.77a6 6 0 01-7.94 7.94l-6.91 6.91a2.12 2.12 0 01-3-3l6.91-6.91a6 6 0 017.94-7.94l-3.76 3.76z"/></svg>
    <span class="lbl">{$_ADMINLANG.setup.config}</span>
</a>

<a href="#" id="sidebarExpand" class="ri sbro" title="Expand Sidebar" style="display: none;">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-bar-right" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M6 8a.5.5 0 0 0 .5.5h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L12.293 7.5H6.5A.5.5 0 0 0 6 8m-2.5 7a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5"/>
    </svg>
</a>

{* IntelliSearch hidden form, opened from topbar magnifier *}
<div class="intellisearch" id="intelliSearchForm">
    <form method="post" action="{routePath('admin-search-intellisearch')}">
        <input type="hidden" id="intelliSearchHideInactive" name="hide_inactive" value="1">
        <i class="fas fa-search loader"></i>
        <div class="input-group">
            <input type="text" name="searchterm" class="form-control" id="inputIntelliSearchValue" placeholder="{$_ADMINLANG.searchPlaceholder}">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button" id="btnIntelliSearchClose" onclick="$('#intelliSearchForm').removeClass('active')">
                    <i class="far fa-times closer"></i>
                </button>
            </span>
        </div>
        <input type="hidden" id="intelliSearchExpand" name="more" value="">
    </form>
</div>


