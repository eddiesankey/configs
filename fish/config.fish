abbr -a e nvim
abbr -a vim nvim


if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g -x fish_greeting ''

# Fish git prompt
function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color D699B6
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color 7FBBB3
		echo -n (basename $PWD)
	end
	set_color A7C080
	printf '%s ' (__fish_git_prompt)
	set_color E67E80
	echo -n '| '
	set_color normal
end



# file system listing 
if command exa --version > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

# starting tmux on startup 
if command -v tmux &> /dev/null && [ -z "$TMUX" ]
    tmux attach -t tmux || tmux new -s tmux
end

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3


# Everforest colour theme
set -g fish_color_normal          D3C6AA
set -g fish_color_error           E67E80
set -g fish_color_command         A7C080
set -g fish_color_param           DBBC7F
set -g fish_color_quote           83C092
set -g fish_color_redirection     E69875
set -g fish_color_end             E67E80
set -g fish_color_comment         859289
set -g fish_color_autosuggestion  9DA9A0
set -g fish_color_selection       543A48
set -g fish_color_search_match    A7C080
set -g fish_color_operator        E69875
set -g fish_color_escape          D699B6
set -g fish_color_cwd             A7C080
set -g fish_color_cwd_root        7FBBB3
set -g fish_color_valid_path      83C092
set -g fish_color_history_current 3A515D
set -g fish_pager_color_completion D3C6AA
set -g fish_pager_color_description A7C080
set -g fish_pager_color_prefix    E67E80
set -g fish_pager_color_progress  7A8478


# color for fish default prompts item
set --universal fish_color_cancel         d699b6 # the '^C' indicator on a canceled command
set --universal fish_color_host           a7c080 # current host system in some of fish default prompts
set --universal fish_color_host_remote    a7c080 # current host system in some of fish default prompts, if fish is running remotely (via ssh or similar)
set --universal fish_color_user           d699b6 # current username in some of fish default prompts

set -gx fish_user_paths ~/nvim/nvim-linux64/bin $fish_user_paths

# sssh agent
if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end