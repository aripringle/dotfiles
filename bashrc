export EDITOR=vim

MY_INCLUDE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias screen="_ssh_auth_init ; screen -c $MY_INCLUDE_DIR/screenrc"

	_ssh_auth_init() {
		if [ ! $SSH_AUTH_SOCK ]
		then
			eval `ssh-agent`
			ssh-add
			trap "kill $SSH_AGENT_PID" 0
		fi
		ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh-auth-sock"
	}

