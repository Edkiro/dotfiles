# Add VSCode to PATH
$env.PATH = ($env.PATH | append '/usr/local/bin/code')

if ($nu.is-interactive) {
    open ~/.config/wezterm/rasmus.txt | print
  }

# Set Homebrew environment variables in Nushell
let brew_env = ("/opt/homebrew/bin/brew" shellenv | from bash)
$env.HOMEBREW_PREFIX = $brew_env.HOMEBREW_PREFIX
$env.HOMEBREW_CELLAR = $brew_env.HOMEBREW_CELLAR
$env.HOMEBREW_REPOSITORY = $brew_env.HOMEBREW_REPOSITORY
$env.PATH = ($brew_env.PATH | split row (char esep))
$env.MANPATH = ($brew_env.MANPATH | split row (char esep))
$env.INFOPATH = ($brew_env.INFOPATH | split row (char esep))

