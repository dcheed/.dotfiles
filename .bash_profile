# Set up base environment (or just use $HOME)
export BASE="dev"
export BASEPATH="${HOME}/${BASE}"
export DOTFILES="${BASEPATH}/.dotfiles"

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc";
fi

