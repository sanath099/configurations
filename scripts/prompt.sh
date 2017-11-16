#!/bin/bash
# Anything between \[ and \] are considered non-printing characters. Sent as 
# as an control signals to the terminal

# Inside escape sequence colors are used using \e[ or \033[
# before \] you need an "m" to indicate that
# you are giving a color sequence
#

escape="\["
_escape="\]"
color="\033["
_color="m"

norm="0"
bold="1"
und="4"

red="31"
red_norm="${escape}${color}${norm};${red}${_color}${_escape}"
red_bold="${escape}${color}${bold};${red}${_color}${_escape}"
red_und="${escape}${color}${und};${red}${_color}${_escape}"

black="30"
black_norm="${escape}${color}${norm};${black}${_color}${_escape}"
black_bold="${escape}${color}${bold};${black}${_color}${_escape}"
black_und="${escape}${color}${und};${black}${_color}${_escape}"

green="32"
green_norm="${escape}${color}${norm};${green}${_color}${_escape}"
green_bold="${escape}${color}${bold};${green}${_color}${_escape}"
green_und="${escape}${color}${und};${green}${_color}${_escape}"

yellow="33"
yellow_norm="${escape}${color}${norm};${yellow}${_color}${_escape}"
yellow_bold="${escape}${color}${bold};${yellow}${_color}${_escape}"
yellow_und="${escape}${color}${und};${yellow}${_color}${_escape}"

blue="34"
blue_norm="${escape}${color}${norm};${blue}${_color}${_escape}"
blue_bold="${escape}${color}${bold};${blue}${_color}${_escape}"
blue_und="${escape}${color}${und};${blue}${_color}${_escape}"

purple="35"
purple_norm="${escape}${color}${norm};${purple}${_color}${_escape}"
purple_bold="${escape}${color}${bold};${purple}${_color}${_escape}"
purple_und="${escape}${color}${und};${purple}${_color}${_escape}"

cyan="36"
cyan_norm="${escape}${color}${norm};${cyan}${_color}${_escape}"
cyan_bold="${escape}${color}${bold};${cyan}${_color}${_escape}"
cyan_und="${escape}${color}${und};${cyan}${_color}${_escape}"

white="37"
white_norm="${escape}${color}${norm};${white}${_color}${_escape}"
white_bold="${escape}${color}${bold};${white}${_color}${_escape}"
white_und="${escape}${color}${und};${white}${_color}${_escape}"

end_color="\[\e[0m\]"

function ip_addr {
	ip_list=$(hostname -I)
	ip_addr=$(echo $ip_list | awk '{print $1}')
	if [ "$(echo $ip_addr | awk -F. '{print $1}')" == "192" ];
	then
		vpn_ip_addr=$(echo $ip_list | awk '{print $2}')
		echo $vpn_ip_addr
	else
		echo $ip_addr
	fi
}

function prev_error {
	if [ "$?" -eq 0 ]; then
		echo "${green_norm}✔${end_color}"
	else
		echo "${red_norm}✗${end_color}"
	fi
}

function git_status {
	if $(git rev-parse --is-inside-work-tree > /dev/null 2>&1); then
		mod=0
		staged=0
		mod=$(git status --porcelain | grep "^ M" | wc -l) 
		staged=$(git status --porcelain | grep "^M" | wc -l) 

		echo "git M-${mod} S-${staged}"
	else
		echo "not git"
	fi
}

export PROMPT_COMMAND=update_prompt

function update_prompt {
	PS1="${cyan_norm}┌─[$(prev_error)${cyan_norm}]"
	PS1+="─[\u@$(ip_addr):$(pwd)]─"
#	PS1+="─[$(git_status)]──"
#	PS1+="─[$(pwd)]──"
	PS1+="\n└──•${end_color} "
}
