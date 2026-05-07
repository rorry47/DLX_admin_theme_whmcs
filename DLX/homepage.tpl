{*
 * DLX WHMCS Admin Theme — homepage (dashboard)
 * Uses the real WHMCS widget API: $staticWidgets, $sortableWidgets, (array)$hiddenWidgets
 * Pattern taken from blend/homepage.tpl which is proven to work.
 *}

<div class="clearfix"></div>

{$infobox}

{foreach from=$addons_html item=addon_html}
    <div class="addon-html-output-container">{$addon_html}</div>
{/foreach}

{* Widget settings dropdown *}
<div id="widgetSettingsDropdown" class="btn-group widget-settings pull-right">
    <button type="button" class="btn btn-link btn-sm" id="widgetSettings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="8" r="1"/><circle cx="12" cy="12" r="1"/><circle cx="12" cy="16" r="1"/></svg>
        <span class="sr-only">{lang key='global.settings'}</span>
    </button>
    <ul id="widgetSettingsDropdownMenu" class="dropdown-menu pull-right" aria-labelledby="widgetSettings">
        <li><h4>{lang key='home.configureWidgetDisplayTitle'}</h4></li>
        {foreach $widgets as $widget}
            <li{if !in_array($widget->getId(), (array)$hiddenWidgets)} class="active"{/if}>
                <label class="checkbox-inline">
                    <input type="checkbox" class="display-widget"{if !in_array($widget->getId(), (array)$hiddenWidgets)} checked="checked"{/if} data-widget="{$widget->getId()}" value="1">
                    {$widget->getTitle()}
                </label>
            </li>
        {/foreach}
    </ul>
</div>

{$homepagePromotionCarousel}
{$mixPanelBanner}

{* Static (non-draggable) widgets *}
{foreach $staticWidgets as $widget}
    <div id="panel{$widget->getId()}" class="dashboard-panel-static-item dashboard-panel-item-columns-{$widget->getColumnSize()}{if in_array($widget->getId(), (array)$hiddenWidgets)} hidden{/if}">
        {if $widget->showWrapper()}
        <div class="card widget-{$widget->getId()|strtolower}" data-widget="{$widget->getId()}">
            <div class="card-head">
                <div class="widget-tools">
                    <a href="#" class="widget-refresh"><i class="fas fa-sync"></i></a>
                    <a href="#" class="widget-minimise"><i class="fas fa-chevron-up"></i></a>
                    <a href="#" class="widget-hide"><i class="fas fa-times"></i></a>
                </div>
                <h3 class="card-title">{$widget->getTitle()}</h3>
            </div>
            <div class="card-body">
        {/if}
        {$widget->render()}
        {if $widget->showWrapper()}
            </div>
        </div>
        {/if}
    </div>
{/foreach}

{* Sortable widgets — uses masonry from blend's vendor.js *}
<div class="home-widgets-container" data-masonry='{literal}{"itemSelector":".dashboard-panel-item","columnWidth":".dashboard-panel-sizer","percentPosition":"true"}{/literal}'>    <div class="dashboard-panel-sizer"></div>

    {foreach $sortableWidgets as $widget}
        <div id="panel{$widget->getId()}" data-widget="{$widget->getId()}" class="dashboard-panel-item dashboard-panel-item-columns-{$widget->getColumnSize()}{if in_array($widget->getId(), (array)$hiddenWidgets)} hidden{/if}">
            {if $widget->showWrapper()}
                <div class="card widget-{$widget->getId()|strtolower}" data-widget="{$widget->getId()}">
                    <div class="card-head">
                        <div class="widget-tools">
                            <a href="#" class="widget-refresh"><i class="fas fa-sync"></i></a>
                            <a href="#" class="widget-minimise"><i class="fas fa-chevron-up"></i></a>
                            <a href="#" class="widget-hide"><i class="fas fa-times"></i></a>
                        </div>
                        <h3 class="card-title">{$widget->getTitle()}</h3>
                    </div>
                    <div class="card-body">
            {/if}

            {$widget->render()}

            {if $widget->showWrapper()}
                    </div>
                </div>
            {/if}
        </div>
    {/foreach}
</div>

{$generateInvoices}
{$creditCardCapture}
