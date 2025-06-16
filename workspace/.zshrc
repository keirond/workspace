# ===============================================================================
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CACHE_DIR="$HOME/.cache/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
export ZSH_CUSTOM="$ZSH/custom"

# ===============================================================================
autoload -Uz compinit
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"
if [[ ! -s "$ZSH_COMPDUMP" || "$ZSH_COMPDUMP" -ot ~/.zshrc ]]; then
  compinit -i -d "$ZSH_COMPDUMP"
else
  compinit -d "$ZSH_COMPDUMP"
fi

# ===============================================================================
# THEME
ZSH_THEME="keiron"

# ===============================================================================
# PLUGIN
plugins=(
    man
	git
	mvn
	npm
	yarn
	python
	virtualenv
	z
)

if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
	plugins+=(zsh-autosuggestions)
fi
if [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
	plugins+=(zsh-syntax-highlighting)
fi

# ===============================================================================
# CONFIG
# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

if command -v hostname &>/dev/null; then
	ip_address=$(hostname -I | awk '{print $1}')
	echo -ne "\033]0;IP: $ip_address\007"
fi

# ===============================================================================

[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ===============================================================================
# ALIAS
alias reload="source ~/.zshrc"
alias vim=nvim

alias ll='ls -hlF'
alias la='ls -A'
alias l='ls -CF'

if [ -x /usr/bin/dircolors ] && [ -s "$HOME/.dircolors" ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# ===============================================================================
# BIND_KEY

# ===============================================================================
# PATH
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# ===============================================================================
export GO_DIR="$HOME/.local/go"
if [ -d "$GO_DIR" ]; then
	export PATH="$GO_DIR/bin:$PATH"
fi

# ===============================================================================
# NODE VERSION MANAGER
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

# ===============================================================================
# MINICONDA
export MINICONDA_HOME="$HOME/miniconda3"
if [ -d "$MINICONDA_HOME" ]; then
	export PATH="$MINICONDA_HOME/bin:$PATH"
fi

# ===============================================================================
# HELM
export HELM_COMPLETION="$HOME/.config/zsh/completions/helm.zsh"
if [ -f "$HELM_COMPLETION" ]; then
    source "$HELM_COMPLETION"
fi

# ===============================================================================