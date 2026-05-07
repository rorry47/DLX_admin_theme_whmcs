            </div>{* /.page *}
        </main>{* /.main *}
    </div>{* /.app *}

    <footer class="footer">
        <div class="copyright">
            {* Removal of the WHMCS copyright notice is strictly prohibited *}
            {* Branding removal entitlement does not permit this line to be removed *}
            Copyright &copy;
            <a href="https://www.whmcs.com/" target="_blank">WHMCS</a> {date('Y')}.
            All Rights Reserved.
        </div>
        <div class="links">
            <a href="https://www.whmcs.com/report-a-bug" target="_blank">Report a Bug</a>
            |
            <a href="https://go.whmcs.com/1893/docs" target="_blank">Documentation</a>
            |
            <a href="https://www.whmcs.com/contact" target="_blank">Contact Us</a>
        </div>
        
       <div class="links">
            <span>Design by</span>
            
            <a href="https://nkotov.net" target="_blank">//.nkotov</a>
            |
            <a href="https://github.com/rorry47/DLX_admin_theme_whmcs" target="_blank">GitHub</a>
        </div>
    </footer>

    {* ============ TWEAKS PANEL ============ *}
    <div class="tw" id="tw">
        <div class="tw-head">
            <span>Tweaks</span>
            <button type="button" id="twClose" aria-label="Close">×</button>
        </div>
        <div class="tw-body">
            <div class="tw-row">
                <label>Theme</label>
                <div class="seg" id="themeSeg">
                    <button type="button" data-v="dark" class="on">Dark</button>
                    <button type="button" data-v="light">Light</button>
                </div>
            </div>
            <div class="tw-row">
                <label>Accent</label>
                <div class="swatches" id="accentSwatches">
                    <button type="button" class="on" data-v="#2e7cf6" data-ink="#ffffff" style="background:#2e7cf6" aria-label="Blue"></button>
                    <button type="button" data-v="#d97757" data-ink="#1a0e08" style="background:#d97757" aria-label="Coral"></button>
                    <button type="button" data-v="#5a7fa6" data-ink="#06101e" style="background:#5a7fa6" aria-label="Steel"></button>
                    <button type="button" data-v="#4f9a6a" data-ink="#06160c" style="background:#4f9a6a" aria-label="Moss"></button>
                    <button type="button" data-v="#c25b8c" data-ink="#1d0612" style="background:#c25b8c" aria-label="Magenta"></button>
                    <button type="button" data-v="#c9a14b" data-ink="#1c1305" style="background:#c9a14b" aria-label="Brass"></button>
                </div>
            </div>
        </div>
    </div>

    {include file="$template/intellisearch-results.tpl"}
    {include file="$template/includes.tpl"}
    {$footeroutput}

</body>
</html>
