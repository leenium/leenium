# Ensure we have gum available
if ! command -v gum &>/dev/null; then
  leenium-pkg-add gum
fi

# Get terminal size from /dev/tty (works in all scenarios: direct, sourced, or piped)
if [[ -e /dev/tty ]]; then
  TERM_SIZE=$(stty size 2>/dev/null </dev/tty)

  if [[ -n $TERM_SIZE ]]; then
    export TERM_HEIGHT=$(echo "$TERM_SIZE" | cut -d' ' -f1)
    export TERM_WIDTH=$(echo "$TERM_SIZE" | cut -d' ' -f2)
  else
    # Fallback to reasonable defaults if stty fails
    export TERM_WIDTH=80
    export TERM_HEIGHT=24
  fi
else
  # No terminal available (e.g., non-interactive environment)
  export TERM_WIDTH=80
  export TERM_HEIGHT=24
fi

export LOGO_PATH="$LEENIUM_PATH/logo.txt"
export LOGO_WIDTH=$(awk '{ if (length > max) max = length } END { print max+0 }' "$LOGO_PATH" 2>/dev/null || echo 0)
export LOGO_HEIGHT=$(wc -l <"$LOGO_PATH" 2>/dev/null || echo 0)

export PADDING_LEFT=$(((TERM_WIDTH - LOGO_WIDTH) / 2))
export PADDING_LEFT_SPACES=$(printf "%*s" $PADDING_LEFT "")

# Shared Leenium installer colors derived from website, Plymouth, and Limine.
export LEENIUM_COLOR_BG="#060b0f"
export LEENIUM_COLOR_PANEL="#0b1319"
export LEENIUM_COLOR_LINE="#1d313d"
export LEENIUM_COLOR_TEXT="#d8f7ea"
export LEENIUM_COLOR_MUTED="#8cb7a9"
export LEENIUM_COLOR_ACCENT="#35d6a0"
export LEENIUM_COLOR_ACCENT_BRIGHT="#5cf0ad"
export LEENIUM_COLOR_WARN="#ffd479"
export LEENIUM_COLOR_ERROR="#ff5f56"

export GUM_CONFIRM_PROMPT_FOREGROUND="$LEENIUM_COLOR_ACCENT"
export GUM_CONFIRM_SELECTED_FOREGROUND="$LEENIUM_COLOR_BG"
export GUM_CONFIRM_SELECTED_BACKGROUND="$LEENIUM_COLOR_ACCENT"
export GUM_CONFIRM_UNSELECTED_FOREGROUND="$LEENIUM_COLOR_TEXT"
export GUM_CONFIRM_UNSELECTED_BACKGROUND="$LEENIUM_COLOR_BG"
export PADDING="0 0 0 $PADDING_LEFT"         # Gum Style
export GUM_CHOOSE_PADDING="$PADDING"
export GUM_FILTER_PADDING="$PADDING"
export GUM_INPUT_PADDING="$PADDING"
export GUM_SPIN_PADDING="$PADDING"
export GUM_TABLE_PADDING="$PADDING"
export GUM_CONFIRM_PADDING="$PADDING"

clear_logo() {
  printf "\033[0m\033[38;2;216;247;234m\033[48;2;6;11;15m\033[H\033[2J" # Reset style, apply Leenium bg/text, clear screen
  gum style --foreground "$LEENIUM_COLOR_ACCENT_BRIGHT" --padding "1 0 0 $PADDING_LEFT" "$(<"$LOGO_PATH")"
}
