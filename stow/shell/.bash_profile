export CODEPATH="$HOME/Code"
export GNUPGHOME="$HOME/.gnupg"
export PRETTIERD_LOCAL_PRETTIER_ONLY="1"
export EDITOR="vim"
export VISUAL="vim"

eval "$(/opt/homebrew/bin/brew shellenv)"

# version managers
eval "$(fnm env --use-on-cd --shell bash)"
eval "$(rbenv init - --no-rehash bash)"


export PATH="$HOME/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/make/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/grep/libexec/gnubin:$PATH"

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init bash --print-full-init)"
fi
