{*
 * nkotov WHMCS Admin Theme — common include block
 * Bootstraps client-side niceties: theme persistence, accent swatches, tweaks panel,
 * IntelliSearch overlay, and dropdown wiring.
 *}

<script type="text/javascript">
$(function () {
    // ---- Theme + accent persistence (scoped to admin area) ----
    var THEME_KEY = "whmcs.nkotov.theme";
    var ACCENT_KEY = "whmcs.nkotov.accent";

    function applyTheme(t) {
        document.body.dataset.theme = t;
        try { localStorage.setItem(THEME_KEY, t); } catch (e) {}
        $("#themeSeg button").removeClass("on").filter('[data-v="' + t + '"]').addClass("on");
    }
    function applyAccent(hex, ink) {
        document.documentElement.style.setProperty("--accent", hex);
        if (ink) document.documentElement.style.setProperty("--accent-ink", ink);
        try { localStorage.setItem(ACCENT_KEY, JSON.stringify({ hex: hex, ink: ink })); } catch (e) {}
        $("#accentSwatches button").removeClass("on").filter('[data-v="' + hex + '"]').addClass("on");
    }

    // restore
    try {
        var t = localStorage.getItem(THEME_KEY);
        if (t === "light" || t === "dark") applyTheme(t);
        var a = localStorage.getItem(ACCENT_KEY);
        if (a) { a = JSON.parse(a); if (a && a.hex) applyAccent(a.hex, a.ink); }
    } catch (e) {}

    // controls
    $("#themeBtn").on("click", function () {
        applyTheme(document.body.dataset.theme === "dark" ? "light" : "dark");
    });
    $("#themeSeg button").on("click", function () { applyTheme($(this).data("v")); });
    $("#accentSwatches button").on("click", function () {
        applyAccent($(this).data("v"), $(this).data("ink"));
    });

    // tweaks panel
    $("#tweakBtn").on("click", function (e) {
        e.preventDefault();
        $("#tw").toggleClass("on");
    });
    $("#twClose").on("click", function () { $("#tw").removeClass("on"); });

    // ---- Add-new flyout (rail) ----
    $("#navAddNew").on("click", function (e) {
        e.preventDefault();
        $(this).toggleClass("flyout-open");
    });
    $(document).on("click", function (e) {
        if (!$(e.target).closest("#navAddNew").length) {
            $("#navAddNew").removeClass("flyout-open");
        }
    });

    // ---- Sidebar minimise persistence ----
    var SIDE_KEY = "whmcs.nkotov.sidemin";
    try {
        if (localStorage.getItem(SIDE_KEY) === "1") $("body").addClass("side-min");
    } catch (e) {}
    $("#sidebarClose").on("click", function (e) {
        e.preventDefault();
        $("body").toggleClass("side-min");
        try { localStorage.setItem(SIDE_KEY, $("body").hasClass("side-min") ? "1" : "0"); } catch (e) {}
    });

    // ---- IntelliSearch close on Esc ----
    $(document).on("keydown", function (e) {
        if (e.key === "Escape") $("#intelliSearchForm").removeClass("active");
    });
});
</script>

{* Modals re-used by sidebar shortcuts (generate invoices / cc captures) *}
<div class="modal fade" id="modalGenerateInvoices" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document"><div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">{$_ADMINLANG.invoices.geninvoices}</h4>
        </div>
        <div class="modal-body">
            <p>{$_ADMINLANG.invoices.geninvoicesdesc}</p>
            <p><a href="{routePath('admin-billing-invoice-generate')}" class="btn btn-primary">{$_ADMINLANG.global.continue} →</a></p>
        </div>
    </div></div>
</div>

<div class="modal fade" id="modalCreditCardCapture" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document"><div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">{$_ADMINLANG.invoices.attemptcccaptures}</h4>
        </div>
        <div class="modal-body">
            <p>{$_ADMINLANG.invoices.attemptcccapturesdesc}</p>
            <p><a href="{routePath('admin-billing-cc-captures')}" class="btn btn-primary">{$_ADMINLANG.global.continue} →</a></p>
        </div>
    </div></div>
</div>
