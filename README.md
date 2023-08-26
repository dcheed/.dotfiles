# .dotfiles

DIY config file management on MacOS and Linux

## Setup

- Create `.dotfiles` directory wherever you want
- Export `$BASEPATH` and `$DOTFILES` in your `.bash_profile`
```bash
export BASE="dev"
export BASEPATH="${HOME}/${BASE}" 
export DOTFILES="${BASEPATH}/.dotfiles"
```
    - `$BASEPATH` can just be `$HOME` if you want, I prefer to work from a non-home directory on MacOS
- Source `.bashrc` in `.bash_profile`
```bash
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc";
fi
```
- Move your dotfiles (including `.bashrc` and `.bash_profile`) into `$DOTFILES`
- Source bash dotfiles in `.bashrc` however you want
```bash
declare -a BASH_DOTFILE_LIST=(
    ".env"
    ".aliases"
    ".functions"
    ".prompt"
    ".secret"  # !!! ADD TO .gitignore
)
for BASH_DOTFILE in "${BASH_DOTFILE_LIST[@]}"; do
    BASH_DOTFILE_PATH="$DOTFILES/$BASH_DOTFILE"
    if [ -f "$BASH_DOTFILE_PATH" ]; then
        source "$BASH_DOTFILE_PATH"
    fi
done
```
- In the end you'll have something like this
```text
$HOME/
│
├── $BASEPATH/.dotfiles/
│   ├── .aliases
│   ├── .bash_profile
│   ├── .bashrc
│   ├── .env
│   ├── .functions
│   ├── .gitconfig
│   ├── .inputrc
│   ├── .ipython
│   ├── .prompt
│   ├── .secret  # !!! ADD TO .gitignore
│   ├── .vimrc
│   └── .README.md
│
├── ...
│
├── .aliases@
├── .bash_profile@
├── .bashrc@
├── .env@
├── .functions@
├── .gitconfig@
├── .inputrc@
├── .ipython@
├── .prompt@
├── .secret@
└── .vimrc@
```


## To-do

- Script to symlink automatically
- Script to push/pull from git automatically
- Brew script to download common apps/plugins
- Split out vimrc into multiple files


## Maybe future plans

```text
.dotfiles/
│
├── bash/
│   ├── .aliases
│   ├── .bashrc
│   ├── .env
│   ├── .functions
│   ├── .inputrc
│   ├── .profile
│   └── .prompt
│
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
│
├── vim/
│   ├── .aliases
│   ├── .autocommands
│   ├── .colorscheme
│   ├── .keymapping
│   └── .vimrc
│
├── .docker/
├── .ipython_config
├── push.sh          # Push to GH
├── install.sh       # Install everything (new laptop, etc)
└── README.md
```
