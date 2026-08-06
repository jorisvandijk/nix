#!/usr/bin/env zsh
ok()   { echo "  ✓ $1" }
fail() { echo "  ✗ $1" }
chk()  { eval "$2" &>/dev/null && ok "$1" || fail "$1" }

echo "\n=== Shell ==="
chk "zsh is active"               '[[ $SHELL == *zsh* ]]'
chk "EDITOR=micro"                 '[[ $EDITOR == micro ]]'
chk "COLORTERM=truecolor"          '[[ $COLORTERM == truecolor ]]'
chk "scripts in PATH"              'echo $PATH | grep -q git/scripts'
chk "go/bin in PATH"               'echo $PATH | grep -q go/bin'

echo "\n=== Aliases ==="
chk "ls → eza (jList)"             'alias ls | grep -q jList'
chk "cat → bat"                    'alias cat | grep -q bat'
chk "ga → git add"                 'alias ga | grep -q "git add"'
chk "server alias exists"          'alias server | grep -q 192.168'

echo "\n=== Functions ==="
chk "cl() defined"                 'typefunc=$(type cl); [[ $typefunc == *function* ]]'
chk "gc() defined"                 'typefunc=$(type gc); [[ $typefunc == *function* ]]'
chk "h() defined"                  'typefunc=$(type h);  [[ $typefunc == *function* ]]'

echo "\n=== Plugins ==="
chk "zsh-autosuggestions loaded"   '[[ -n $ZSH_AUTOSUGGEST_STRATEGY ]]'
chk "fzf available"                'command -v fzf'
chk "zoxide available"             'command -v zoxide'
chk "abbr available"               'command -v abbr'

echo "\n=== Abbreviations ==="
chk "copy abbr"                    'abbr list 2>/dev/null | grep -q copy'
chk "symlink abbr"                 'abbr list 2>/dev/null | grep -q symlink'
chk "data global abbr"             'abbr list 2>/dev/null | grep -q data'

echo "\n=== Tools ==="
chk "micro available"              'command -v micro'
chk "kitty available"              'command -v kitty'
chk "newsboat available"           'command -v newsboat'
chk "yazi available"               'command -v yazi'

echo "\n=== Config files ==="
chk "~/.zshrc exists (HM)"         '[[ -f ~/.zshrc ]]'
chk "~/.zprofile exists (HM)"      '[[ -f ~/.zprofile ]]'
chk "micro settings.json"          '[[ -e ~/.config/micro/settings.json ]]'
chk "micro bindings.json"          '[[ -e ~/.config/micro/bindings.json ]]'
chk "kitty.conf"                   '[[ -e ~/.config/kitty/kitty.conf ]]'
chk "newsboat config"              '[[ -e ~/.config/newsboat/config ]]'
chk "newsboat urls"                '[[ -e ~/.config/newsboat/urls ]]'
chk "karabiner.json symlink"       '[[ -L ~/.config/karabiner/karabiner.json ]]'
chk "hammerspoon init.lua"         '[[ -e ~/.hammerspoon/init.lua ]]'

echo ""
