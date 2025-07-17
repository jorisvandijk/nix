{
  programs = {
    firefox = {
      enable = true;
      languagePacks = [
        "nl"
        "en-US"
      ];

      # ---- POLICIES ----
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or default-on"
        SearchBar = "unified"; # alternative: "separate"
        SearchEngines = {
          PreventInstalls = true;
          Remove = [
            "Google"
            "Bing"
            "Amazon.com"
            "eBay"
            "Twitter"
            "Wikipedia (en)"
            "Qwant"
            "Ecosia"
            "Yahoo"
            "Yandex"
            "Baidu"
            "AOL"
            "Ask.com"
            "Wolfram Alpha"
          ];
        };
        DisableSearchSuggest = true;
        DisableSearchBar = true;
        DisableSearchUpdate = true;

        # ---- EXTENSIONS ----
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        # Basic syntax without listToAttrs is:
        # ExtensionSettings = {
        #   "uuid" = {
        #     install_url = "https://...";
        #     installation_mode = "force_installed";
        #     default_area = "menupanel";
        #   };
        # };
        ExtensionSettings =
          with builtins;
          let
            extension = shortID: uuid: {
              name = uuid;
              value = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/${shortID}/latest.xpi";
                installation_mode = "force_installed";
                default_area = "menupanel"; # or "navbar"
              };
            };
          in
          listToAttrs [
            {
              name = "*";
              value = {
                installation_mode = "blocked";
              };
            }
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "sponsorblock" "sponsorBlocker@ajay.app")
            (extension "i-dont-care-about-cookies" "jid1-KKzOGWgsW3Ao4Q@jetpack")
            (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
            (extension "startpage-private-search" "{20fc2e06-e3e4-4b2b-812b-ab431220cada}")
            (extension "2fas-two-factor-authentication" "admin@2fas.com")
          ];

        # ---- PREFERENCES ----
        # Check about:config for options.
        Preferences =
          let
            newtab = "browser.newtabpage.activity-stream";
            lock-false = {
              Value = false;
              Status = "locked";
            };
            lock-true = {
              Value = true;
              Status = "locked";
            };
          in
          {
            "browser.contentblocking.category" = {
              Value = "strict";
              Status = "locked";
            };
            "dom.security.https_only_mode" = lock-true;
            "extensions.pocket.enabled" = lock-false;
            "extensions.screenshots.disabled" = lock-true;
            "browser.topsites.contile.enabled" = lock-false;
            "browser.formfill.enable" = lock-false;
            "browser.search.suggest.enabled" = lock-false;
            "browser.search.suggest.enabled.private" = lock-false;
            "browser.urlbar.suggest.searches" = lock-false;
            "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
            "${newtab}.feeds.section.highlights" = lock-false;
            "${newtab}.feeds.section.topstories" = lock-false;
            "${newtab}.feeds.snippets" = lock-false;
            "${newtab}.section.highlights.includePocket" = lock-false;
            "${newtab}.section.highlights.includeBookmarks" = lock-false;
            "${newtab}.section.highlights.includeDownloads" = lock-false;
            "${newtab}.section.highlights.includeVisited" = lock-false;
            "${newtab}.showSponsored" = lock-false;
            "${newtab}.system.showSponsored" = lock-false;
            "${newtab}.showSponsoredTopSites" = lock-false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = lock-false;
            "dom.reporting.crash.enabled" = lock-false;
            "browser.tabs.crashReporting.sendReport" = lock-false;
            "sidebar.revamp" = true; 
            "sidebar.verticalTabs" = true; 
            "browser.search.update" = lock-false;
            "browser.search.reset.enabled" = lock-false;
            "browser.search.removeDb" = {
              Value = true;
              Status = "locked";
            };
            "browser.search.defaultenginename" = {
              Value = "DuckDuckGo";
              Status = "locked";
            };
            "browser.search.selectedEngine" = {
              Value = "DuckDuckGo";
              Status = "locked";
            };
            # Disable Picture-in-Picture video controls
            "media.videocontrols.picture-in-picture.enabled" = lock-false;
            # Disable save and fill payment methods
            "extensions.formautofill.creditCards.enabled" = lock-false;
          };
      };
    };
  };
}
