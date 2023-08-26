# History
shopt -s histappend
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
HISTSIZE=1000
HISTFILESIZE=2000

export EDITOR=vi

# Source bash dotfiles
declare -a BASH_DOTFILE_LIST=(
    ".env"
    ".aliases"
    ".functions"
    ".prompt"
    ".secret"
)
for BASH_DOTFILE in "${BASH_DOTFILE_LIST[@]}"; do
    BASH_DOTFILE_PATH="$DOTFILES/$BASH_DOTFILE"
    if [ -f "$BASH_DOTFILE_PATH" ]; then
        source "$BASH_DOTFILE_PATH"
    fi
done

