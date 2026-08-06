{ config, ... }:
{
  imports = [ ./shell.nix ];

  home.username = "joris";
  home.homeDirectory = "/Users/joris";
  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
    settings = {
      user.name = "Joris";
      user.email = "joris@jorisvandijk.com";
      init.defaultBranch = "main";
      core.hooksPath = "/Users/joris/.git-hooks";
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      size = 14;
    };
    themeFile = ./config/kitty/dracula.conf;
    settings = {
      bell_type = "none";
      enable_audio_bell = "no";
      confirm_os_window_close = -1;
      scrollback_lines = 100000;
      window_margin_width = 4;
      enabled_layouts = "splits";
    };
    keybindings = {
      "cmd+h" = "previous_tab";
      "cmd+l" = "next_tab";
      "cmd+j" = "previous_tab";
      "cmd+k" = "next_tab";
      "cmd+b" = "launch --location=vsplit";
      "cmd+w" = "close_window_with_confirmation ignore-shell";
    };
  };

  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "dracula";
      mkparents = true;
      softwrap = true;
      wordwrap = true;
    };
  };

  xdg.configFile."micro/bindings.json".source = ./config/micro/bindings.json;
  xdg.configFile."micro/colorschemes/dracula.micro".source = ./config/micro/colorschemes/dracula.micro;

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    keymap = {
      manager.prepend_keymap = [
        {
          on = [ "Z" ];
          run = "cd $(zoxide query --interactive)";
          desc = "Jump with zoxide";
        }
      ];
    };
  };

  programs.newsboat = {
    enable = true;
    autoReload = true;
    reloadTime = 60;
    reloadThreads = 10;
    browser = "open -a 'LibreWolf' %u";
    extraConfig = ''
      reload-only-visible-feeds no
      refresh-on-startup yes
      download-path "~/Downloads/newsboat/%n"
      max-downloads 4
      articlelist-format "%4i %f %D  %?T?|%-17T| ?%t"
      feedlist-format "%4i %n %11u %t"
      datetime-format "%b %d"
      feed-sort-order lastupdated
      bind-key j down
      bind-key k up
      bind-key J next-feed articlelist
      bind-key K prev-feed articlelist
      bind-key G end
      bind-key g home
      bind-key l open
      bind-key h quit
      show-read-feeds yes
      show-read-articles yes
      cleanup-on-quit yes
      confirm-exit no
      notify-program "terminal-notifier -title 'Newsboat' -message"
      notify-always yes
      notify-screen yes
    '';
    urls = [
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqVEHtQoXHmUCfJ-9smpTSg"; title = "Answer in progress"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCc9CjaAjsMMvaSghZB7-Kog"; title = "BeardMeatsFood"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHs596idK1P0-wJZQSlk-Uw"; title = "Benita Larsson"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCTGHqw41qk_WyK3wJK7nweg"; title = "Brickcrafts"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpZHSdA35z3t1B6alZN1Z6Q"; title = "ContuberniumSPQR"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCje6-Yak9u1msy5l7sE9pBA"; title = "Deconstructed"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUQo7nzH1sXVpzL92VesANw"; title = "DIY Perks"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC226u9zaUA5HT-TSiWHmiaQ"; title = "GanshirtArt"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLqQ5m7AXj_oyUvLZPsts0Q"; title = "Hands On Katie"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZXvtZFMfY9Urftv6m22_5Q"; title = "Imperium Romanum"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsXVk37bltHxD1rDPwtNM8Q"; title = "Kurzgesagt – In a Nutshell"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC3XTzVzaHQEd30rQbuvCtTQ"; title = "LastWeekTonight"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHqDTfIX-0DGaHlWvv6JZCw"; title = "Lateral with Tom Scott"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCn7xknPbWDjGQCzBLhtubiA"; title = "LUBACH"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJ24N4O0bP7LGLBDvye7oCA"; title = "Matt D'Avella"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMrMVIBtqFW6O0-MWq26gqw"; title = "my mechanics"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCq8ZAAsI89IoJ-fn1gYpO3g"; title = "Nighshift"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0intLFzLaudFG-xAvUEO-A"; title = "Not Just Bikes"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEEYC7-n3iCQSyZBAZOmpEg"; title = "OG Crew"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAuEjBW8MgKN9DyCvjEPFew"; title = "OttiIie"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmxePybUpZj8RRuWz6r8uTQ"; title = "Politievlogger Jan-Willem"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAL3JXZSzSm8AlZyD3nQdBA"; title = "Primitive Technology"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQD-0MjUbDBwm2UTVYr0Dag"; title = "Suibhne"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2SMpy2oZV6BoyJEYShw9bw"; title = "TA Outdoors"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCy0tKL1T7wFoYcxCe0xjN6Q"; title = "Technology Connections"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCylGUf9BvQooEFjgdNudoQg"; title = "The Linux Cast"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2LVhJH_9cT2XKp0VAfsKOQ"; title = "The Tim Traveler"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCBa659QWEk1AI4Tg--mrJ2A"; title = "Tom Scott"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCL14t3D_hreM5WnorC3VJ5g"; title = "What On Earth Is This?"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsnGwSIHyoYN0kiINAGUKxg"; title = "Wolfgang's Channel"; }
      { url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC26icivaGpMKZ6Tx7Sp5pGA"; title = "Fallout fan videos"; }
      { url = "https://jorisvandijk.com/index.xml"; title = "Joris"; }
      { url = "https://jorisvandijk.com/microblog/index.xml"; title = "Joris MB"; }
      { url = "https://jak2k.eu/bookmarks.xml/"; title = "Indieweb dude"; }
    ];
  };

  home.file.".hammerspoon/init.lua".source = ./config/hammerspoon/init.lua;

  xdg.configFile."karabiner/karabiner.json".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/git/nix/config/karabiner/karabiner.json";
}
