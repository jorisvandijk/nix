{ ... }:
{
  home.file.".hammerspoon/init.lua".text = ''
    local function fillScreen(win)
        if not win or not win:isStandard() then return end

        local screen = win:screen()
        if not screen then return end

        local frame = screen:frame()
        win:setFrame(frame, 0)
    end

    local wf = hs.window.filter.new()
    wf:subscribe(hs.window.filter.windowCreated, fillScreen)

    for _, win in ipairs(hs.window.allWindows()) do
        fillScreen(win)
    end

    hs.execute([[
        defaults write com.apple.dock autohide -bool true
        defaults write com.apple.dock autohide-delay -float 100000000
        defaults write com.apple.dock tilesize -int 1
        killall Dock
    ]])

    hs.alert.show("Hammerspoon is loaded!")
  '';
}
