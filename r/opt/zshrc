export TERM="xterm-256color"
  export ZSH=$HOME/.oh-my-zsh
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status command_execution_time background_jobs todo ram load rvm time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh os_icon context dir rbenv vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
plugins=(
    zsh-completions
    zsh-autosuggestions
    history-substring-search
    screen
    k
    # zsh-wakatime          # enable if you use wakatime with 'https://github.com/wbingli/zsh-wakatime'
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:~/.local/bin
NPM_PACKAGES="${HOME}/.npm"
PATH="$NPM_PACKAGES/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

export MARKER_KEY_NEXT_PLACEHOLDER="\C-b"   #change maker key binding from Ctr+t to Ctr+b

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

export PATH=$PATH:~/.quickzsh/todo/bin    #usig alias doesn't properly work

autoload -U compinit && compinit        # zsh-completions

SAVEHIST=50000      #save upto 50,000 lines in history. oh-my-zsh default is 10,000

alias myip="wget -qO- https://wtfismyip.com/text"	# quickly show external ip address
alias l="ls -lah"
alias x="exit"
alias k="k -h"						# show human readable filesizes, in kb, mb etc

alias tide='sudo tide'
alias setup='sudo setup'
alias setwg='sudo setwg'
alias useopenvpn='sudo tide && sudo useopenvpn'
alias usesocks='sudo tide && sudo usesocks'
alias usesocksdns='sudo tide && sudo usesocksdns'
alias usesockshttp='sudo tide && sudo usesockshttp'
alias usessh='sudo tide && sudo usessh'
alias usesauth='sudo tide && sudo usesauth'
alias usehauth='sudo tide && sudo usehauth'
alias usev6sauth='sudo tide && sudo usev6sauth'
alias usev6hauth='sudo tide && sudo usev6hauth'
alias usesshdns='sudo tide && sudo usesshdns'
alias usesshltc='sudo tide && sudo usesshltc'
alias glider='sudo glider'
alias settime='sudo settime'
alias prettyping='sudo prettyping'
alias gost='sudo gost'
alias lnxrouter='sudo lnxrouter'
alias changehostname='sudo changehostname'
alias welcomemessage='sudo welcomemessage'
alias help="zsh"
alias cat="bat --theme ansi-dark"
alias kickthemout="sudo /usr/bin/kickthemout"

clear ; clear ; . /etc/update-motd.d/30-armbian-sysinfo ; echo "" ; echo "" ; /usr/bin/bat -p --paging never -l bash --theme Dracula /opt/welcome.md ; echo "" ; export LC_ALL=C
