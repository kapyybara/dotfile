if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

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

# Default config for prettierd
set -u PRETTIERD_DEFAULT_CONFIG "/home/iwku/.config/nvim/plugin.prettierrc.json"


# The fuck 
function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge ^ /dev/null
  end
end

# Alias
alias nvim "~/nvim.appimage"
alias vim "~/nvim.appimage"
alias v "~/nvim.appimage"
alias cat "batcat"

alias lpdc "cp /home/iwku/.config/nvim/default_var/.prettierrc ./"
