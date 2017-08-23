export ANTIGEN_CACHE=false
source $ANTIGEN_DIR/antigen.zsh

# Load the oh-my-zsh's library
antigen use prezto

antigen bundles <<EOBUNDLES
    # Bundles from the default repo
    environment
    terminal
    history
    directory
    utility
    ssh
    tmux
    completion
    homebrew
    osx
    git
    command-not-found
    syntax-highlighting
    history-substring-search
    prompt
EOBUNDLES

# Sets Prezto options.

# General

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':prezto:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':prezto:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':prezto:load' zfunction 'zargs' 'zmv'

# Git

# Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
zstyle ':prezto:module:git:status:ignore' submodules 'all'

# History Substring Search

# Set the query found color.
# zstyle ':prezto:module:history-substring-search:color' found ''

# Set the query not found color.
# zstyle ':prezto:module:history-substring-search:color' not-found ''

# Set the search globbing flags.
# zstyle ':prezto:module:history-substring-search' globbing-flags ''

# Pacman

# Set the Pacman frontend.
zstyle ':prezto:module:pacman' frontend 'pacaur'

# Prompt

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'pure'

# Python

# Auto switch the Python virtualenv on directory change.
# zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'

# Automatically initialize virtualenvwrapper if pre-requisites are met.
# zstyle ':prezto:module:python:virtualenv' initialize 'yes'

# SSH

# Set the SSH identities to load into the agent.
zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_rsa2' 'id_github'

# Syntax Highlighting

# Set syntax highlighters.
# By default, only the main highlighter is enabled.
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root'
#
# Set syntax highlighting styles.
# zstyle ':prezto:module:syntax-highlighting' styles \
#   'builtin' 'bg=blue' \
#   'command' 'bg=blue' \
#   'function' 'bg=blue'
#
# Set syntax pattern styles.
# zstyle ':prezto:module:syntax-highlighting' pattern \
#   'rm*-rf*' 'fg=white,bold,bg=red'

# Terminal

# Auto set the tab and window titles.
zstyle ':prezto:module:terminal' auto-title 'yes'

# Set the window title format.
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'

# Set the tab title format.
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'

# Set the terminal multiplexer title format.
zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

# Tmux

# Auto start a session when Zsh is launched in a local terminal.
# zstyle ':prezto:module:tmux:auto-start' local 'yes'

# Auto start a session when Zsh is launched in a SSH connection.
# zstyle ':prezto:module:tmux:auto-start' remote 'yes'

# Integrate with iTerm2.
zstyle ':prezto:module:tmux:iterm' integrate 'yes'

# Set the default session name:
# zstyle ':prezto:module:tmux:session' name 'YOUR DEFAULT SESSION NAME'

# Utility

# Enabled safe options. This aliases cp, ln, mv and rm so that they prompt
# before deleting or overwriting files. Set to 'no' to disable this safer
# behavior.
zstyle ':prezto:module:utility' safe-ops 'no'

# Tell antigen that you're done
antigen apply
