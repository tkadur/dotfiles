# Created by newuser for 5.2

# We provide a few (useful) aliases and scripts for you to get started:

### cc <arguments to gcc> -- Invokes gcc with the flags you will usually use
### valgrind-leak <arguments to valgrind> -- Invokes valgrind in the mode to show all leaks
### hidden <arguments to ls> -- Displays ONLY the hidden files
### killz <program name> -- Kills all programs with the given program name
### shell -- Displays the name of the shell being used
### get_cs_afs_access -- Sets up cross-realm authentication with CS.CMU.EDU so you can access files stored there.

# More features may be added later as thought of or requested.


# ----- guard against non-interactive logins ---------------------------------
[ -z "$PS1" ] && return


# ----- convenient alias and function definitions ----------------------------

# color support for ls and grep
alias grep='grep --color=auto'
if [[ `uname` = "Darwin" || `uname` = "FreeBSD" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias killz='killall -9 '
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias shell='ps -p $$ -o comm='
alias sml='rlwrap sml'
alias math='rlwrap MathKernel'
alias coin='rlwrap coin'

alias cc='gcc -Wall -W -ansi -pedantic -O2 '
alias valgrind-leak='valgrind --leak-check=full --show-reachable=yes'

# End GPI additions

alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias lh='ls -d .*'
alias lhl='ls -ld .*'

alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"

alias back="cd -"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias i3config="vim ~/.config/i3/config"
fi

alias mine="sudo chown $(whoami)"
alias vi="vim"

# Syncing data with Andrew servers
#alias sync-from-andrew='rsync -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server/"'
#alias sync-from-andrew-dry-run='rsync --dry-run -avz -e ssh --progress andrew:~/private "/Users/Thejas/Google Drive/CMU/andrew_server"'
#alias sync-to-andrew='rsync -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'
#alias sync-to-andrew-dry-run='rsync --dry-run -avz -e ssh --progress "/Users/Thejas/Google Drive/CMU/andrew_server/private" andrew:~'

alias chromemem="ps -ev | grep -i chrome | awk '{print \$12}' | awk '{for(i=1;i<=NF;i++)s+=\$i}END{print s}'"
alias chromemem="echo 'Chrome is using $(chromemem)% of memory.'"

alias pyserver="python -m SimpleHTTPServer"

vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

# User color
case $(id -u) in
	0) user_color="$RED" ;;  # root
	*) user_color="$GREEN" ;;
esac

# Symbols
prompt_symbol="❯"
prompt_clean_symbol="☀ "
prompt_dirty_symbol="☂ "
prompt_venv_symbol="☁ "

function prompt_command() {
	# Local or SSH session?
	local remote=
	[ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && remote=1

	# Git branch name and work tree status (only when we are inside Git working tree)
	local git_prompt=
	if [[ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
		# Branch name
		local branch="$(git symbolic-ref HEAD 2>/dev/null)"
		branch="${branch##refs/heads/}"

		# Working tree status (red when dirty)
		local dirty=
		# Modified files
		git diff --no-ext-diff --quiet --exit-code --ignore-submodules 2>/dev/null || dirty=1
		# Untracked files
		[ -z "$dirty" ] && test -n "$(git status --porcelain)" && dirty=1

		# Format Git info
		if [ -n "$dirty" ]; then
			git_prompt=" $RED$prompt_dirty_symbol$branch$NOCOLOR"
		else
			git_prompt=" $GREEN$prompt_clean_symbol$branch$NOCOLOR"
		fi
	fi

	# Virtualenv
	local venv_prompt=
	if [ -n "$VIRTUAL_ENV" ]; then
	    venv_prompt=" $BLUE$prompt_venv_symbol$(basename $VIRTUAL_ENV)$NOCOLOR"
	fi

	# Only show username if not default
	local user_prompt=""
	#[ "$USER" != "$local_username" ] && user_prompt="$user_color$USER$NOCOLOR"

	# Show hostname inside SSH session
	local host_prompt=""
	#[ -n "$remote" ] && host_prompt="@$YELLOW$HOSTNAME$NOCOLOR"

	# Show delimiter if user or host visible
	local login_delimiter=""
	#[ -n "$user_prompt" ] || [ -n "$host_prompt" ] && login_delimiter=":"

	# Format prompt
	first_line="$user_prompt$host_prompt$login_delimiter$WHITE\w$NOCOLOR$git_prompt$venv_prompt"
	# Text (commands) inside \[...\] does not impact line length calculation which fixes stange bug when looking through the history
	# $? is a status of last command, should be processed every time prompt prints
	second_line="\`if [ \$? = 0 ]; then echo \[\$CYAN\]; else echo \[\$RED\]; fi\`\$prompt_symbol\[\$NOCOLOR\] "
	PS1="\n$first_line\n$second_line"

	# Multiline command
	PS2="\[$CYAN\]$prompt_symbol\[$NOCOLOR\] "

	# Terminal title
	local title="$(basename "$PWD")"
	[ -n "$remote" ] && title="$title \xE2\x80\x94 $HOSTNAME"
	echo -ne "\033]0;$title"; echo -ne "\007"
}

# Show awesome prompt only if Git is istalled
command -v git >/dev/null 2>&1 && PROMPT_COMMAND=prompt_command
