# Only execute this file once per shell.
set -q __fish_home_manager_config_sourced; and exit
set -g __fish_home_manager_config_sourced 1

set -gx CODEPATH "$HOME/Code"
set -gx GNUPGHOME "$HOME/.gnupg"
set -gx PRETTIERD_LOCAL_PRETTIER_ONLY '1'
set -gx EDITOR 'vim'
set -gx VISUAL 'vim'


status is-login; and begin
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # version managers
    fnm env --use-on-cd --shell fish | source
    rbenv init - --no-rehash fish | source

    # Login shell initialisation

    fish_add_path --move --prepend --path \
        "$HOME/bin" \
        "$HOMEBREW_PREFIX/opt/curl/bin" \
        "$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin" \
        "$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin" \
        "$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin" \
        "$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin" \
        "$HOMEBREW_PREFIX/opt/make/libexec/gnubin" \
        "$HOMEBREW_PREFIX/opt/grep/libexec/gnubin"

    set fish_user_paths $fish_user_paths

end

status is-interactive; and begin

    # Interactive shell initialisation
    alias vim="nvim"

    # disable the welcome message
    set fish_greeting

    # required by GPG agent
    set -x GPG_TTY (tty)

    fish_default_key_bindings

    if test "$TERM" != dumb
        starship init fish | source
    end

end
