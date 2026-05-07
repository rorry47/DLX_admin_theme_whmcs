<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="referrer" content="same-origin">

    <title>WHMCS · {$pagetitle}</title>

    {* Bootstrap 3 + WHMCS core styles (re-used from blend so plugins keep working) *}
    {\WHMCS\View\Asset::fontCssInclude('open-sans-family.css')}
    <link href="templates/DLX/css/all.min.css?v={$versionHash}322222212w2s1ww113122112dww2" rel="stylesheet" />
    <link href="templates/DLX/css/blend-theme.min.css?v={$versionHash}1ww12" rel="stylesheet" />

    {* Our skin — must come AFTER blend so it overrides everything *}
    <link href="templates/DLX/css/theme.css?v={$versionHash}1www21w22" rel="stylesheet" />
    <link href="{$WEB_ROOT}/assets/fonts/css/fontawesome.min.css" rel="stylesheet" />
    <link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-solid.min.css" rel="stylesheet" />
    <link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-regular.min.css" rel="stylesheet" />
    <link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-light.min.css" rel="stylesheet" />
    <link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-brands.min.css" rel="stylesheet" />
    <link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-duotone.min.css" rel="stylesheet" />

    {* WHMCS still ships jQuery + Bootstrap 3 via the Blend bundle; we re-use them so plugins keep working. *}
    <script type="text/javascript" src="templates/DLX/js/vendor.min.js?v={$versionHash}1"></script>
    <script type="text/javascript" src="templates/DLX/js/scripts.min.js?v={$versionHash}1"></script>
    <script type="text/javascript" src="templates/DLX/js/scripts.js?v={$versionHash}1www1122ww221"></script>

    <script>
        var datepickerformat = "{$datepickerformat}",
            csrfToken="{$csrfToken}",
            adminBaseRoutePath = "{\WHMCS\Admin\AdminServiceProvider::getAdminRouteBase()}",
            whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";

        {if $jquerycode}
            $(document).ready(function(){ldelim}
                {$jquerycode}
            {rdelim});
        {/if}
        {if $jscode}
            {$jscode}
        {/if}
    </script>

    {$headoutput}

</head>
<body data-theme="dark"
      class="nkotov-admin {if empty($sidebar)}no-sidebar{/if}{if !empty($globalAdminWarningMsg)} has-warning-banner{/if}"
      data-phone-cc-input="{if !empty($phoneNumberInputStyle)}{$phoneNumberInputStyle}{/if}">

    {$headeroutput}

    {if !empty($globalAdminWarningMsg)}
    <div class="alert alert-warning global-admin-warning">
        <i class="far fa-exclamation-triangle fa-fw"></i>
        {$globalAdminWarningMsg}
    </div>
    {/if}

    {* ============ TOPBAR ============ *}
    <header class="topbar" id="topbar">
        <div class="brand">//<span class="accent">.</span>whmcs <span class="ver">{$licenseinfo.currentversion}</span></div>

        {* ── + ADD NEW dropdown in topbar ── *}
        {if in_array("Add New Client", $admin_perms) || in_array("Add New Order", $admin_perms) || in_array("Create Invoice", $admin_perms) || in_array("Manage Quotes", $admin_perms) || in_array("Open New Ticket", $admin_perms)}
        <div class="topbar-addnew" id="topbarAddNewWrap">
            <button type="button" id="topbarAddNew" class="topbar-addnew-btn" title="{$_ADMINLANG.addNew.title}">
                <svg class="ico" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            </button>
            <ul id="topbarAddNewMenu" class="topbar-addnew-menu">
                {if in_array("Add New Client", $admin_perms)}<li><a href="clientsadd.php">{$_ADMINLANG.addNew.client}</a></li>{/if}
                {if in_array("Add New Order", $admin_perms)}<li><a href="ordersadd.php">{$_ADMINLANG.addNew.order}</a></li>{/if}
                {if in_array("Create Invoice", $admin_perms)}<li><a href="{routePath('admin-billing-invoice-new')}" class="open-modal" data-modal-title="{lang key='addNew.invoice'}" {if !empty($anyGatewaysActivated)}data-btn-submit-id="btnCreateInvoice" data-btn-submit-label="{lang key='invoices.create'}"{/if}>{lang key='addNew.invoice'}</a></li>{/if}
                {if in_array("Manage Quotes", $admin_perms)}<li><a href="quotes.php?action=manage">{$_ADMINLANG.addNew.quote}</a></li>{/if}
                {if in_array("Open New Ticket", $admin_perms)}<li><a href="supporttickets.php?action=open">{$_ADMINLANG.addNew.ticket}</a></li>{/if}
            </ul>
        </div>
        {/if}

        <div style="flex:1"></div>
        <div class="right">
            <button type="button" title="Search" id="btnIntelliSearch" onclick="$('#intelliSearchForm').addClass('active');$('#inputIntelliSearchValue').focus();return false;">
                <svg class="ico" viewBox="0 0 24 24"><circle cx="11" cy="11" r="7"/><line x1="21" y1="21" x2="16.6" y2="16.6"/></svg>
            </button>
            <a href="{routePath('admin-setup-index')}" title="{$_ADMINLANG.setup.config}">
                <button type="button">
                    <svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.6 1.6 0 00.3 1.8l.1.1a2 2 0 11-2.8 2.8l-.1-.1a1.6 1.6 0 00-1.8-.3 1.6 1.6 0 00-1 1.5V21a2 2 0 11-4 0v-.1a1.6 1.6 0 00-1-1.5 1.6 1.6 0 00-1.8.3l-.1.1a2 2 0 11-2.8-2.8l.1-.1a1.6 1.6 0 00.3-1.8 1.6 1.6 0 00-1.5-1H3a2 2 0 110-4h.1a1.6 1.6 0 001.5-1 1.6 1.6 0 00-.3-1.8l-.1-.1a2 2 0 112.8-2.8l.1.1a1.6 1.6 0 001.8.3H9a1.6 1.6 0 001-1.5V3a2 2 0 114 0v.1a1.6 1.6 0 001 1.5 1.6 1.6 0 001.8-.3l.1-.1a2 2 0 112.8 2.8l-.1.1a1.6 1.6 0 00-.3 1.8V9a1.6 1.6 0 001.5 1H21a2 2 0 110 4h-.1a1.6 1.6 0 00-1.5 1z"/></svg>
                </button>
            </a>

            <a href="systemhealthandupdates.php"  title="{$_ADMINLANG.healthCheck.menuTitle}">
                <button type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-activity" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M6 2a.5.5 0 0 1 .47.33L10 12.036l1.53-4.208A.5.5 0 0 1 12 7.5h3.5a.5.5 0 0 1 0 1h-3.15l-1.88 5.17a.5.5 0 0 1-.94 0L6 3.964 4.47 8.171A.5.5 0 0 1 4 8.5H.5a.5.5 0 0 1 0-1h3.15l1.88-5.17A.5.5 0 0 1 6 2"/>
                    </svg>               
                </button>
            </a>

            <a href="systemactivitylog.php" title="{$_ADMINLANG.utilities.activitylog}">
                <button type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-code" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M8.646 5.646a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1 0 .708l-2 2a.5.5 0 0 1-.708-.708L10.293 8 8.646 6.354a.5.5 0 0 1 0-.708m-1.292 0a.5.5 0 0 0-.708 0l-2 2a.5.5 0 0 0 0 .708l2 2a.5.5 0 0 0 .708-.708L5.707 8l1.647-1.646a.5.5 0 0 0 0-.708"/>
                      <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"/>
                      <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"/>
                    </svg>             
                </button>
            </a>
            
            <a href="automationstatus.php" title="{$_ADMINLANG.utilities.automationStatus}">
                <button type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-speedometer2" viewBox="0 0 16 16">
                      <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4M3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707M2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10m9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5m.754-4.246a.39.39 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.39.39 0 0 0-.029-.518z"/>
                      <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A8 8 0 0 1 0 10m8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3"/>
                    </svg>                
                </button>
            </a>
            <button type="button" title="Tweaks" id="tweakBtn">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-palette2" viewBox="0 0 16 16">
                  <path d="M0 .5A.5.5 0 0 1 .5 0h5a.5.5 0 0 1 .5.5v5.277l4.147-4.131a.5.5 0 0 1 .707 0l3.535 3.536a.5.5 0 0 1 0 .708L10.261 10H15.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-.5.5H3a3 3 0 0 1-2.121-.879A3 3 0 0 1 0 13.044m6-.21 7.328-7.3-2.829-2.828L6 7.188zM4.5 13a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0M15 15v-4H9.258l-4.015 4zM0 .5v12.495zm0 12.495V13z"/>
                </svg>
            </button>
            <button type="button" title="Toggle theme" id="themeBtn">
                <svg class="ico" viewBox="0 0 24 24"><path d="M21 12.8A9 9 0 1111.2 3a7 7 0 009.8 9.8z"/></svg>
            </button>
            <a href="https://docs.whmcs.com/{$helplink}" target="_blank" title="{$_ADMINLANG.help.docs}">
                <button type="button">
                    <svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><path d="M9.1 9a3 3 0 015.8 1c0 2-3 3-3 3"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
                </button>
            </a>
            <div class="account-dropdown">
                <a href="myaccount.php" class="av-link" title="{$_ADMINLANG.global.myaccount}">
                    <button type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                          <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                        </svg>
                    </button>
                </a>
                <ul id="topbarAccountMenu" class="topbar-Account-menu">
                    <li><a href="myaccount.php">{$_ADMINLANG.global.myaccount}</a></li>
                    <li><a href="logout.php">{$_ADMINLANG.global.logout}</a></li>
                </ul>
            </div>
        </div>
    </header>

    {* ============ APP SHELL ============ *}
    <div class="app">

        {* LEFT ICON RAIL *}
        <nav class="rail" id="rail">
            {include file="$template/nav.tpl"}
        </nav>

        {* SIDEBAR (WHMCS-style) *}
        {if !empty($sidebar)}
        <aside class="side{if $minsidebar} minimized{/if}" id="sidebar">
            <div class="sidebar-collapse">
                {include file="$template/sidebar.tpl"}
            </div>
        </aside>
        {/if}

        {* MAIN CONTENT *}
        <main class="main" id="contentarea">
            <div class="page">
                {if !$isCustomHeader}
                    <div class="page-head">
                        {if $pagetitle == $_ADMINLANG.global.hometitle}
                            <h1>{$pagetitle}</h1>
                        {else}
                            <h1>{$pagetitle}</h1>
                        {/if}
                    </div>
                {/if}
