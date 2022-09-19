if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# rust & cargo
set -gx PATH "$HOME/.cargo/bin" $PATH;

# Nvm Node
set --universal nvm_default_version v18.4.0

# pnpm
set -gx PNPM_HOME "/home/iwku/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
alias pn=pnpm
# pnpm end

# Golang
set -gx GO_HOME "/usr/local/go/bin"
set -gx PATH "$GO_HOME" $PATH
