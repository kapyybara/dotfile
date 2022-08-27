if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# rust & cargo
set -gx PATH "$HOME/.cargo/bin" $PATH;

# Nvm Node
set --universal nvm_default_version v18.4.0