# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
# Also add Python libraries to PATH
PATH=/usr/local/bin:/usr/bin:/bin
PATH="/usr/sbin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/sbin:$PATH"
PATH="/Library/TeX/texbin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
PATH="$HOME/.rbenv/bin:$PATH"
PATH="$HOME/google-cloud-sdk/bin:$PATH"
PATH="$HOME/lean-3.4.0-darwin/bin:$PATH"
PATH="$HOME/DrMemory-MacOS-1.11.0-2/bin:$PATH"
PATH="$HOME/bin:$PATH"
export PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Enable TrueColor support for NeoVim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Source .bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# opam configuration
test -r /Users/samarth/.opam/opam-init/init.sh && . /Users/samarth/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# fzf C-r support
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
