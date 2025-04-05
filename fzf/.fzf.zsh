# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
# source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# fzf-tab with fzf preview
# ---------------
export _PREVIEW_="$VRS_ENV/zsh/config.d/functions/fzf-preview.zsh"
local extract="
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
local -A ctxt
for entry in \${(@ps:\2:)CTXT}; do
    local key=\${entry%%=*}
    local value=\${entry#*=}
    ctxt[\$key]=\$value
done
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"
zstyle ':fzf-tab:complete:*:*' fzf-flags --preview=$extract';$_PREVIEW_ $realpath' --bind shift-up:preview-page-up,shift-down:preview-page-down
