# shellcheck shell=bash
# Leenium (system-wide, from /usr/share/leenium/default/etc)
export LEENIUM_PATH=/usr/share/leenium
case ":$PATH:" in *":$LEENIUM_PATH/bin:"*) ;; *) export PATH="$LEENIUM_PATH/bin:$PATH" ;; esac
if [ -n "$BASH_VERSION" ]; then
  command -v zoxide >/dev/null && eval "$(zoxide init bash)"
  command -v eza >/dev/null && alias ls='eza --group-directories-first'
fi
