{*
 * nkotov WHMCS Admin Theme — contextual sidebar
 * Branches by $sidebar value (set per-page by core WHMCS controllers).
 * Each block uses .side-block, headings use .side-block h4, links use .shortcut.
 *}

{if $sidebar eq "home"}

    <div class="side-block">
        <h4>
            <svg class="ico" viewBox="0 0 24 24"><polygon points="12 2 15 8.6 22 9.3 17 14 18.2 21 12 17.8 5.8 21 7 14 2 9.3 9 8.6 12 2"/></svg>
            {$_ADMINLANG.global.shortcuts}
        </h4>
        <a class="shortcut" href="clientsadd.php">{$_ADMINLANG.clients.addnew}</a>
        <a class="shortcut" href="ordersadd.php">{$_ADMINLANG.orders.addnew}</a>
        <a class="shortcut" href="quotes.php?action=manage">{$_ADMINLANG.quotes.createnew}</a>
        <a class="shortcut" href="todolist.php">{$_ADMINLANG.utilities.todolistcreatenew}</a>
        <a class="shortcut" href="supporttickets.php?action=open">{$_ADMINLANG.support.opennewticket}</a>
        <a class="shortcut" href="whois.php">{$_ADMINLANG.utilities.whois}</a>
        <a class="shortcut" href="#" data-toggle="modal" data-target="#modalGenerateInvoices">{$_ADMINLANG.invoices.geninvoices}</a>
        <a class="shortcut" href="#" data-toggle="modal" data-target="#modalCreditCardCapture">{$_ADMINLANG.invoices.attemptcccaptures}</a>
    </div>

    <div class="side-block">
        <h4>
            <svg class="ico" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2h-4v-7h-6v7H5a2 2 0 01-2-2z"/></svg>
            {$_ADMINLANG.global.systeminfo}
        </h4>
        <div class="info-list">
            <div>{$_ADMINLANG.license.regto}: <b>{$licenseinfo.registeredname}</b></div>
            <div>{$_ADMINLANG.license.type}: <b>{$licenseinfo.productname}</b></div>
            <div>{$_ADMINLANG.license.expires}: <b>{$licenseinfo.expires}</b></div>
            <div>{$_ADMINLANG.global.version}: <b>{$licenseinfo.currentversion}</b></div>
            {if $licenseinfo.updateavailable}<div style="color: var(--err); margin-top: 4px;"><b>{$_ADMINLANG.license.updateavailable}</b></div>{/if}
        </div>
    </div>

{elseif $sidebar eq "clients"}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><circle cx="9" cy="8" r="4"/><path d="M2 21c0-3.9 3.1-7 7-7s7 3.1 7 7"/></svg> {$_ADMINLANG.clients.title}</h4>
        <a class="shortcut" href="clients.php">{$_ADMINLANG.clients.viewsearch}</a>
        <a class="shortcut" href="clientsadd.php">{$_ADMINLANG.clients.addnew}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M21 16V8a2 2 0 00-1-1.7l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.7l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"/></svg> {$_ADMINLANG.services.title}</h4>
        <a class="shortcut" href="{routePath('admin-services-index')}">{$_ADMINLANG.services.listall}</a>
        <a class="shortcut" href="{routePath('admin-services-shared')}">{$_ADMINLANG.services.listhosting}</a>
        <a class="shortcut" href="{routePath('admin-services-reseller')}">{$_ADMINLANG.services.listreseller}</a>
        <a class="shortcut" href="{routePath('admin-services-server')}">{$_ADMINLANG.services.listservers}</a>
        <a class="shortcut" href="{routePath('admin-services-other')}">{$_ADMINLANG.services.listother}</a>
        <a class="shortcut" href="{routePath('admin-addons-index')}">{$_ADMINLANG.services.listaddons}</a>
        <a class="shortcut" href="{routePath('admin-domains-index')}">{$_ADMINLANG.services.listdomains}</a>
        <a class="shortcut" href="cancelrequests.php">{$_ADMINLANG.clients.cancelrequests}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M17 1l4 4-4 4M3 11V9a4 4 0 014-4h14M7 23l-4-4 4-4M21 13v2a4 4 0 01-4 4H3"/></svg> {$_ADMINLANG.affiliates.title}</h4>
        <a class="shortcut" href="affiliates.php">{$_ADMINLANG.affiliates.manage}</a>
    </div>

{elseif $sidebar eq "orders"}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M3 6h18l-2 12H5L3 6z"/><circle cx="9" cy="21" r="1"/><circle cx="17" cy="21" r="1"/></svg> {$_ADMINLANG.orders.title}</h4>
        <a class="shortcut" href="orders.php">{$_ADMINLANG.orders.listall}</a>
        <a class="shortcut" href="orders.php?status=Pending">{$_ADMINLANG.orders.listpending}</a>
        <a class="shortcut" href="orders.php?status=Active">{$_ADMINLANG.orders.listactive}</a>
        <a class="shortcut" href="orders.php?status=Fraud">{$_ADMINLANG.orders.listfraud}</a>
        <a class="shortcut" href="orders.php?status=Cancelled">{$_ADMINLANG.orders.listcancelled}</a>
        <a class="shortcut" href="ordersadd.php">{$_ADMINLANG.orders.addnew}</a>
    </div>

{elseif $sidebar eq "billing"}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 000 7h5a3.5 3.5 0 010 7H6"/></svg> {$_ADMINLANG.billing.title}</h4>
        <a class="shortcut" href="transactions.php">{$_ADMINLANG.billing.transactionslist}</a>
        <a class="shortcut" href="gatewaylog.php">{$_ADMINLANG.billing.gatewaylog}</a>
        <a class="shortcut" href="offlineccprocessing.php">{$_ADMINLANG.billing.offlinecc}</a>
        <a class="shortcut" href="{routePath('admin-billing-disputes-index')}">{$_ADMINLANG.disputes.title}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg> {$_ADMINLANG.invoices.title}</h4>
        <a class="shortcut" href="invoices.php">{$_ADMINLANG.invoices.listall}</a>
        <a class="shortcut" href="invoices.php?status=Paid">{$_ADMINLANG.status.paid}</a>
        <a class="shortcut" href="invoices.php?status=Draft">{$_ADMINLANG.status.draft}</a>
        <a class="shortcut" href="invoices.php?status=Unpaid">{$_ADMINLANG.status.unpaid}</a>
        <a class="shortcut" href="invoices.php?status=Overdue">{$_ADMINLANG.status.overdue}</a>
        <a class="shortcut" href="invoices.php?status=Cancelled">{$_ADMINLANG.status.cancelled}</a>
        <a class="shortcut" href="invoices.php?status=Refunded">{$_ADMINLANG.status.refunded}</a>
        <a class="shortcut" href="invoices.php?status=Collections">{$_ADMINLANG.status.collections}</a>
        <a class="shortcut" href="invoices.php?status=Payment%20Pending">{$_ADMINLANG.status.paymentpending}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg> {$_ADMINLANG.billableitems.title}</h4>
        <a class="shortcut" href="billableitems.php">{$_ADMINLANG.billableitems.listall}</a>
        <a class="shortcut" href="billableitems.php?status=Uninvoiced">{$_ADMINLANG.billableitems.uninvoiced}</a>
        <a class="shortcut" href="billableitems.php?status=Recurring">{$_ADMINLANG.billableitems.recurring}</a>
        <a class="shortcut" href="billableitems.php?action=manage">{$_ADMINLANG.billableitems.addnew}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/></svg> {$_ADMINLANG.quotes.title}</h4>
        <a class="shortcut" href="quotes.php">{$_ADMINLANG.quotes.listall}</a>
        <a class="shortcut" href="quotes.php?validity=Valid">{$_ADMINLANG.status.valid}</a>
        <a class="shortcut" href="quotes.php?validity=Expired">{$_ADMINLANG.status.expired}</a>
        <a class="shortcut" href="quotes.php?action=manage">{$_ADMINLANG.quotes.createnew}</a>
    </div>

{elseif $sidebar eq "support"}

    {if $inticket}
        <div class="side-block">
            <h4><svg class="ico" viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg> {$_ADMINLANG.support.ticketinfo}</h4>
            <div class="info-list">
                <div style="font-size: 11px; color: var(--ink-3); text-transform: uppercase; letter-spacing: 0.04em; margin-top: 8px;">{$_ADMINLANG.fields.owner}</div>
                <div style="margin-bottom: 6px;">
                    {if $userid}
                        <a href="clientssummary.php?userid={$userid}" target="_blank">{$clientname}</a>
                        {if $contactid}
                            (<a href="clientscontacts.php?userid={$userid}&contactid={$contactid}" target="_blank">{$contactname}</a>)
                        {/if}
                    {else}
                        <a href="{$SCRIPT_NAME}?email={$email|urlencode}">{$name}</a><br />
                        <span class="muted" style="font-size: 11px;" title="{$email}">{$email}</span>
                    {/if}
                </div>

                <div style="font-size: 11px; color: var(--ink-3); text-transform: uppercase; letter-spacing: 0.04em;">{$_ADMINLANG.fields.requestor}</div>
                <div style="margin-bottom: 6px;">
                    {$requestor.name}<br>
                    <span class="badge muted">
                        {if $requestor.type_normalised eq 'operator'}{lang key='support.requestor.operator'}
                        {elseif $requestor.type_normalised eq 'owner'}{lang key='support.requestor.owner'}
                        {elseif $requestor.type_normalised eq 'authorizeduser'}{lang key='support.requestor.authorizeduser'}
                        {elseif $requestor.type_normalised eq 'registereduser'}{lang key='support.requestor.registereduser'}
                        {elseif $requestor.type_normalised eq 'subaccount'}{lang key='support.requestor.subaccount'}
                        {elseif $requestor.type_normalised eq 'guest'}{lang key='support.requestor.guest'}
                        {/if}
                    </span>
                    <div class="muted" style="font-size: 11px;" title="{$requestor.email}">{$requestor.email}</div>
                </div>

                <div style="font-size: 11px; color: var(--ink-3); text-transform: uppercase; letter-spacing: 0.04em; margin-top: 6px;">{$_ADMINLANG.support.department}</div>
                <input type="hidden" id="currentdeptid" value="{$deptid}" />
                <select id="deptid" data-update-type="deptid" class="sidebar-ticket-ajax form-control">
                    {foreach from=$departments item=department}
                        <option value="{$department.id}"{if $department.id eq $deptid} selected{/if}>{$department.name}</option>
                    {/foreach}
                </select>

                <div style="font-size: 11px; color: var(--ink-3); text-transform: uppercase; letter-spacing: 0.04em; margin-top: 8px;">{$_ADMINLANG.support.assignedto}</div>
                <input type="hidden" id="currentflagto" value="{$flag}" />
                <select id="flagto" data-update-type="flagto" class="sidebar-ticket-ajax form-control">
                    <option value="0">{$_ADMINLANG.global.none}</option>
                    {foreach from=$staff item=staffmember}
                        <option value="{$staffmember.id}"{if $staffmember.id eq $flag} selected{/if}>{$staffmember.name}</option>
                    {/foreach}
                </select>

                <div style="font-size: 11px; color: var(--ink-3); text-transform: uppercase; letter-spacing: 0.04em; margin-top: 8px;">{$_ADMINLANG.support.priority}</div>
                <input type="hidden" id="currentpriority" value="{$priority}" />
                <select id="priority" data-update-type="priority" class="sidebar-ticket-ajax form-control">
                    <option value="High"{if $priority eq "High"} selected{/if}>{$_ADMINLANG.status.high}</option>
                    <option value="Medium"{if $priority eq "Medium"} selected{/if}>{$_ADMINLANG.status.medium}</option>
                    <option value="Low"{if $priority eq "Low"} selected{/if}>{$_ADMINLANG.status.low}</option>
                </select>

                <div style="font-size: 11px; color: var(--ink-3); text-transform: uppercase; letter-spacing: 0.04em; margin-top: 8px;">{$_ADMINLANG.support.staffparticipants}</div>
                <div>
                    {foreach from=$staffinvolved item=staffname}
                        {$staffname}<br />
                    {foreachelse}
                        <span class="muted">No Replies Yet</span>
                    {/foreach}
                </div>

                <div style="font-size: 11px; color: var(--ink-3); text-transform: uppercase; letter-spacing: 0.04em; margin-top: 8px;">{$_ADMINLANG.support.tags}</div>
                <input id="ticketTags" value="{$tags|implode:','}" class="selectize-tags form-control" placeholder="{lang key='support.addTag'}" />

                <div style="margin-top: 10px;">
                    {if $pinnedTicket}
                        <button class="btn btn-sm btn-err" id="pin-ticket" type="button" data-admin-full-name="{$adminFullName}" data-admin-id="{$adminid}" data-ticket-id="{$ticketid}" data-type="unpin">{lang key="support.unpinTicket"}</button>
                    {else}
                        <button class="btn btn-sm" id="pin-ticket" type="button" data-admin-full-name="{$adminFullName}" data-admin-id="{$adminid}" data-ticket-id="{$ticketid}" data-type="pin">{lang key="support.pinTicket"}</button>
                    {/if}
                    {if $watchingTicket}
                        <button class="btn btn-sm btn-err" id="watch-ticket" type="button" data-admin-full-name="{$adminFullName}" data-admin-id="{$adminid}" data-ticket-id="{$ticketid}" data-type="unwatch">{lang key="support.unwatchTicket"}</button>
                    {else}
                        <button class="btn btn-sm" id="watch-ticket" type="button" data-admin-full-name="{$adminFullName}" data-admin-id="{$adminid}" data-ticket-id="{$ticketid}" data-type="watch">{lang key="support.watchTicket"}</button>
                    {/if}
                </div>
            </div>
        </div>

        {foreach $sidebaroutput as $output}<div>{$output}</div>{/foreach}

        <div class="side-block">
            <h4><svg class="ico" viewBox="0 0 24 24"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg> {$_ADMINLANG.support.ticketWatchers}</h4>
            <div class="info-list">
                <ol id="ticketWatchers" style="margin: 0; padding-left: 18px;">
                    {foreach $ticketWatchers as $k => $ticketWatcher}<li id="ticket-watcher-{$k}">{$ticketWatcher}</li>{/foreach}
                    <li id="ticket-watcher-0"{if $ticketWatchers} class="hidden"{/if}>{$_ADMINLANG.global.none}</li>
                </ol>
            </div>
        </div>

        <div class="side-block">
            <h4><svg class="ico" viewBox="0 0 24 24"><path d="M16 4h2a2 2 0 012 2v14a2 2 0 01-2 2H6a2 2 0 01-2-2V6a2 2 0 012-2h2"/><rect x="8" y="2" width="8" height="4" rx="1"/></svg> {$_ADMINLANG.support.ccrecipients}</h4>
            <div class="info-list">
                {if count($ticketCc) > 0}
                    <ol style="margin: 0; padding-left: 18px;">
                        {foreach $ticketCc as $k => $cc}<li>{$cc}</li>{/foreach}
                    </ol>
                {else}
                    <span class="muted">{lang key="global.none"}</span>
                {/if}
            </div>
        </div>

    {else}
        <div class="side-block">
            <h4><svg class="ico" viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg> {$_ADMINLANG.support.title}</h4>
            <a class="shortcut" href="supportannouncements.php">{$_ADMINLANG.support.announcements}</a>
            <a class="shortcut" href="supportdownloads.php">{$_ADMINLANG.support.downloads}</a>
            <a class="shortcut" href="supportkb.php">{$_ADMINLANG.support.knowledgebase}</a>
            <a class="shortcut" href="supporttickets.php">{$_ADMINLANG.support.supporttickets}</a>
            <a class="shortcut" href="supporttickets.php?action=open">{$_ADMINLANG.support.opennewticket}</a>
            <a class="shortcut" href="supportticketpredefinedreplies.php">{$_ADMINLANG.support.predefreplies}</a>
        </div>
    {/if}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><circle cx="11" cy="11" r="7"/><line x1="21" y1="21" x2="16.6" y2="16.6"/></svg> {$_ADMINLANG.support.filtertickets}</h4>
        <form method="post" action="supporttickets.php" class="field-stack">
            <select name="view">
                <option value="any">- Any -</option>
                <option value=""{if $ticketfilterdata.view eq ""} selected{/if}>{$_ADMINLANG.support.awaitingreply} ({$ticketsawaitingreply})</option>
                <option value="flagged"{if $ticketfilterdata.view eq "flagged"} selected{/if}>{$_ADMINLANG.support.flagged} ({$ticketsflagged})</option>
                <option value="active"{if $ticketfilterdata.view eq "active"} selected{/if}>{$_ADMINLANG.support.allactive} ({$ticketsallactive})</option>
                {foreach from=$ticketstatuses item=status}<option value="{$status.title}"{if $status.title eq $ticketfilterdata.view} selected{/if}>{$status.title} ({$status.count})</option>{/foreach}
            </select>
            <select name="deptid">
                <option value="">- Any -</option>
                {foreach from=$ticketdepts item=dept}<option value="{$dept.id}"{if $dept.id eq $ticketfilterdata.deptid} selected{/if}>{$dept.name}</option>{/foreach}
            </select>
            <input type="text" name="subject" value="{$ticketfilterdata.subject}" placeholder="{$_ADMINLANG.support.subjectmessage}" />
            <input type="text" name="email" value="{$ticketfilterdata.email}" placeholder="{$_ADMINLANG.fields.email}" />
            <button type="submit" class="btn btn-primary btn-sm" style="width:100%;">{$_ADMINLANG.global.filter} »</button>
        </form>
    </div>

    {if $inticketlist}
        <div class="side-block">
            <h4><svg class="ico" viewBox="0 0 24 24"><path d="M20.6 13.4L13.4 20.6a2 2 0 01-2.8 0L2 12V2h10l8.6 8.6a2 2 0 010 2.8z"/><line x1="7" y1="7" x2="7.01" y2="7"/></svg> {$_ADMINLANG.support.tagcloud}</h4>
            <div>{$tagcloud}</div>
        </div>
    {/if}

    {if !$inticket}
        <div class="side-block">
            <h4><svg class="ico" viewBox="0 0 24 24"><path d="M5 12.55a11 11 0 0114 0M1.42 9a16 16 0 0121.16 0M8.53 16.11a6 6 0 016.95 0M12 20h.01"/></svg> {$_ADMINLANG.networkissues.title}</h4>
            <a class="shortcut" href="networkissues.php">{$_ADMINLANG.networkissues.open}</a>
            <a class="shortcut" href="networkissues.php?view=scheduled">{$_ADMINLANG.networkissues.scheduled}</a>
            <a class="shortcut" href="networkissues.php?view=resolved">{$_ADMINLANG.networkissues.resolved}</a>
            <a class="shortcut" href="networkissues.php?action=manage">{$_ADMINLANG.networkissues.addnew}</a>
        </div>
    {/if}

{elseif $sidebar eq "reports"}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M3 3v18h18"/><polyline points="7 14 11 10 14 13 21 6"/></svg> {$_ADMINLANG.reports.title}</h4>
        {foreach from=$text_reports key=filename item=reporttitle}
            {if !in_array($filename, $denied_reports)}
                <a class="shortcut" href="reports.php?report={$filename}">{$reporttitle}</a>
            {/if}
        {/foreach}
    </div>

{elseif $sidebar eq "utilities"}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg> {lang key='utilities.title'}</h4>
        {if in_array('Update WHMCS', $admin_perms)}<a class="shortcut" href="update.php">{lang key='update.title'}</a>{/if}
        {if in_array('WHMCSConnect', $admin_perms)}<a class="shortcut" href="whmcsconnect.php">{lang key='whmcsConnect.whmcsConnectName'}</a>{/if}
        {if in_array('Automation Status', $admin_perms)}<a class="shortcut" href="automationstatus.php">{lang key='utilities.automationStatus'}</a>{/if}
        {if in_array('View Module Queue', $admin_perms)}<a class="shortcut" href="modulequeue.php">{lang key='utilities.moduleQueue'}</a>{/if}
        {if in_array('Configure Domain Pricing', $admin_perms)}<a class="shortcut" href="{routePath('admin-utilities-tools-tld-import-step-one')}">{lang key='utilities.tldImport'}</a>{/if}
        {if in_array('Mass Mail', $admin_perms)}<a class="shortcut" href="{routePath('admin-utilities-tools-email-campaigns')}">{lang key='utilities.emailCampaigns.title'}</a>{/if}
        {if in_array('Email Marketer', $admin_perms)}<a class="shortcut" href="utilitiesemailmarketer.php">{lang key='utilities.emailmarketer'}</a>{/if}
        {if in_array('Link Tracking', $admin_perms)}<a class="shortcut" href="utilitieslinktracking.php">{lang key='utilities.linktracking'}</a>{/if}
        {if in_array('Calendar', $admin_perms)}<a class="shortcut" href="calendar.php">{lang key='utilities.calendar'}</a>{/if}
        {if in_array('To-Do List', $admin_perms)}<a class="shortcut" href="todolist.php">{lang key='utilities.todolist'}</a>{/if}
        {if in_array('WHOIS Lookups', $admin_perms)}<a class="shortcut" href="whois.php">{lang key='utilities.whois'}</a>{/if}
        {if in_array('Domain Resolver Checker', $admin_perms)}<a class="shortcut" href="utilitiesresolvercheck.php">{lang key='utilities.domainresolver'}</a>{/if}
        {if in_array('View Integration Code', $admin_perms)}<a class="shortcut" href="systemintegrationcode.php">{lang key='utilities.integrationcode'}</a>{/if}
        {if in_array('Database Status', $admin_perms)}<a class="shortcut" href="systemdatabase.php">{lang key='utilities.dbstatus'}</a>{/if}
        {if in_array('System Cleanup Operations', $admin_perms)}<a class="shortcut" href="systemcleanup.php">{lang key='utilities.syscleanup'}</a>{/if}
        {if in_array('View PHP Info', $admin_perms)}
            <a class="shortcut" href="systemphpinfo.php">{lang key='utilities.phpinfo'}</a>
            <a class="shortcut" href="{routePath('admin-utilities-system-phpcompat')}">{lang key='utilities.phpcompat'}</a>
        {/if}
    </div>

{elseif $sidebar eq "logs"}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg> {$_ADMINLANG.system.currentTime}</h4>
        <div class="info-list">{$dateTimeNowFormatted}</div>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg> {$_ADMINLANG.utilities.logs}</h4>
        <a class="shortcut" href="systemactivitylog.php">{$_ADMINLANG.utilities.activitylog}</a>
        <a class="shortcut" href="systemadminlog.php">{$_ADMINLANG.utilities.adminlog}</a>
        <a class="shortcut" href="{routePath('admin-logs-module-log')}">{$_ADMINLANG.utilities.modulelog}</a>
        <a class="shortcut" href="systememaillog.php">{$_ADMINLANG.utilities.emaillog}</a>
        <a class="shortcut" href="{routePath('admin-logs-mail-import-log')}">{$_ADMINLANG.utilities.ticketmaillog}</a>
        <a class="shortcut" href="systemwhoislog.php">{$_ADMINLANG.utilities.whoislog}</a>
    </div>

{elseif $sidebar eq "addonmodules"}

    {$addon_module_sidebar}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M21 16V8a2 2 0 00-1-1.7l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.7l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"/></svg> {$_ADMINLANG.utilities.addonmodules}</h4>
        {foreach from=$addon_modules key=filename item=addontitle}
            <a class="shortcut" href="addonmodules.php?module={$filename}">{$addontitle}</a>
        {/foreach}
    </div>

{elseif $sidebar eq "config"}

    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M14.7 6.3a1 1 0 000 1.4l1.6 1.6a1 1 0 001.4 0l3.77-3.77a6 6 0 01-7.94 7.94l-6.91 6.91a2.12 2.12 0 01-3-3l6.91-6.91a6 6 0 017.94-7.94l-3.76 3.76z"/></svg> {$_ADMINLANG.setup.config}</h4>
        <a class="shortcut" href="configgeneral.php">{$_ADMINLANG.setup.general}</a>
        <a class="shortcut" href="{routePath('admin-apps-index')}">{$_ADMINLANG.setup.appsAndIntegrations}</a>
        <a class="shortcut" href="{routePath('admin-setup-authn-view')}">{$_ADMINLANG.setup.signInIntegrations}</a>
        <a class="shortcut" href="configauto.php">{$_ADMINLANG.setup.automation}</a>
        <a class="shortcut" href="marketconnect.php">{$_ADMINLANG.setup.marketconnect}</a>
        <a class="shortcut" href="{routePath('admin-setup-notifications-overview')}">{$_ADMINLANG.setup.notifications}</a>
        {if !isset($cloudMode) || !$cloudMode}<a class="shortcut" href="{routePath('admin-setup-storage-index')}">{$_ADMINLANG.setup.storage}</a>{/if}
        <a class="shortcut" href="configapplinks.php">{$_ADMINLANG.setup.applicationLinks}</a>
        <a class="shortcut" href="configopenid.php">{$_ADMINLANG.setup.openIdConnect}</a>
        <a class="shortcut" href="configemailtemplates.php">{$_ADMINLANG.setup.emailtpls}</a>
        <a class="shortcut" href="configaddonmods.php">{$_ADMINLANG.setup.addonmodules}</a>
        <a class="shortcut" href="configclientgroups.php">{$_ADMINLANG.setup.clientgroups}</a>
        <a class="shortcut" href="configcustomfields.php">{$_ADMINLANG.setup.customclientfields}</a>
        <a class="shortcut" href="configfraud.php">{$_ADMINLANG.setup.fraud}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><circle cx="9" cy="8" r="4"/><path d="M2 21c0-3.9 3.1-7 7-7s7 3.1 7 7"/></svg> {$_ADMINLANG.setup.staff}</h4>
        <a class="shortcut" href="configadmins.php">{$_ADMINLANG.setup.admins}</a>
        <a class="shortcut" href="configadminroles.php">{$_ADMINLANG.setup.adminroles}</a>
        <a class="shortcut" href="configtwofa.php">{$_ADMINLANG.setup.twofa}</a>
        <a class="shortcut" href="configapicredentials.php">{$_ADMINLANG.setup.apicredentials}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="6" x2="12" y2="18"/><path d="M16 9.5C16 8 14.4 7 12 7s-4 1-4 2.5S9.6 12 12 12s4 1 4 2.5S14.4 17 12 17s-4-1-4-2.5"/></svg> {$_ADMINLANG.setup.payments}</h4>
        <a class="shortcut" href="configcurrencies.php">{$_ADMINLANG.setup.currencies}</a>
        <a class="shortcut" href="configgateways.php">{$_ADMINLANG.setup.gateways}</a>
        <a class="shortcut" href="{routePath('admin-setup-payments-tax-index')}">{$_ADMINLANG.setup.tax}</a>
        <a class="shortcut" href="configpromotions.php">{$_ADMINLANG.setup.promos}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M21 16V8a2 2 0 00-1-1.7l-7-4a2 2 0 00-2 0l-7 4A2 2 0 003 8v8a2 2 0 001 1.7l7 4a2 2 0 002 0l7-4A2 2 0 0021 16z"/></svg> {$_ADMINLANG.setup.products}</h4>
        <a class="shortcut" href="configproducts.php">{$_ADMINLANG.setup.products}</a>
        <a class="shortcut" href="configproductoptions.php">{$_ADMINLANG.setup.configoptions}</a>
        <a class="shortcut" href="configaddons.php">{$_ADMINLANG.setup.addons}</a>
        <a class="shortcut" href="configbundles.php">{$_ADMINLANG.setup.bundles}</a>
        <a class="shortcut" href="configdomains.php">{$_ADMINLANG.setup.domainpricing}</a>
        <a class="shortcut" href="configregistrars.php">{$_ADMINLANG.setup.registrars}</a>
        <a class="shortcut" href="configservers.php">{$_ADMINLANG.setup.servers}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg> {$_ADMINLANG.support.title}</h4>
        <a class="shortcut" href="configticketdepartments.php">{$_ADMINLANG.setup.supportdepartments}</a>
        <a class="shortcut" href="configticketstatuses.php">{$_ADMINLANG.setup.ticketstatuses}</a>
        <a class="shortcut" href="configticketescalations.php">{$_ADMINLANG.setup.escalationrules}</a>
        <a class="shortcut" href="configticketspamcontrol.php">{$_ADMINLANG.setup.spam}</a>
    </div>
    <div class="side-block">
        <h4><svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.6 1.6 0 00.3 1.8l.1.1a2 2 0 11-2.8 2.8l-.1-.1a1.6 1.6 0 00-1.8-.3 1.6 1.6 0 00-1 1.5V21a2 2 0 11-4 0v-.1a1.6 1.6 0 00-1-1.5 1.6 1.6 0 00-1.8.3l-.1.1a2 2 0 11-2.8-2.8l.1-.1a1.6 1.6 0 00.3-1.8 1.6 1.6 0 00-1.5-1H3a2 2 0 110-4h.1a1.6 1.6 0 001.5-1 1.6 1.6 0 00-.3-1.8l-.1-.1a2 2 0 112.8-2.8l.1.1a1.6 1.6 0 001.8.3H9a1.6 1.6 0 001-1.5V3a2 2 0 114 0v.1a1.6 1.6 0 001 1.5 1.6 1.6 0 001.8-.3l.1-.1a2 2 0 112.8 2.8l-.1.1a1.6 1.6 0 00-.3 1.8V9a1.6 1.6 0 001.5 1H21a2 2 0 110 4h-.1a1.6 1.6 0 00-1.5 1z"/></svg> {$_ADMINLANG.setup.other}</h4>
        <a class="shortcut" href="configorderstatuses.php">{$_ADMINLANG.setup.orderstatuses}</a>
        <a class="shortcut" href="configsecurityqs.php">{$_ADMINLANG.setup.securityqs}</a>
        <a class="shortcut" href="configbannedips.php">{$_ADMINLANG.setup.bannedips}</a>
        <a class="shortcut" href="configbannedemails.php">{$_ADMINLANG.setup.bannedemails}</a>
        {if !isset($cloudMode) || !$cloudMode}<a class="shortcut" href="configbackups.php">{$_ADMINLANG.setup.backups}</a>{/if}
    </div>

{/if}

{* ============ Common: Advanced Search + Staff Online (always shown) ============ *}
<div class="side-block">
    <h4>
        <svg class="ico" viewBox="0 0 24 24"><circle cx="11" cy="11" r="7"/><line x1="21" y1="21" x2="16.6" y2="16.6"/></svg>
        {$_ADMINLANG.global.advancedsearch}
    </h4>
    <form method="get" action="search.php" class="field-stack">
        <select name="type" id="searchtype" onchange="populate(this)">
            <option value="clients">Clients</option>
            <option value="orders">Orders</option>
            <option value="services">Services</option>
            <option value="domains">Domains</option>
            <option value="invoices">Invoices</option>
            <option value="tickets">Tickets</option>
        </select>
        <select name="field" id="searchfield">
            <option>Client ID</option>
            <option selected>Client Name</option>
            <option>Company Name</option>
            <option>Email Address</option>
            <option>Address 1</option>
            <option>Address 2</option>
            <option>City</option>
            <option>State</option>
            <option>Postcode</option>
            <option>Country</option>
            <option>Phone Number</option>
            <option>CC Last Four</option>
        </select>
        <div class="row-search">
            <input type="text" name="q" />
            <button type="submit">{$_ADMINLANG.global.search}</button>
        </div>
    </form>
</div>

<div class="side-block staff-online">
    <h4>
        <svg class="ico" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21v-1a8 8 0 0116 0v1"/></svg>
        {$_ADMINLANG.global.staffonline}
    </h4>
    <div class="info-list">{$adminsonline}</div>
</div>

<div class="side-block" style="border-bottom: 0;">
    <a href="#" id="sidebarClose" class="minimise"
       onclick="toggleSidebar(); return false;">
        « Minimise Sidebar
    </a>
</div>