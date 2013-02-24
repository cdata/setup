# For unstaged(*) and staged(+) values next to branch name in __git_ps1
GIT_PS1_SHOWDIRTYSTATE="enabled"
 
function prompt_command() {
    # Check http://github.com/Sirupsen/dotfiles for screenshot
    PS1="$bold_black\h $blue\W/$green$(__git_ps1 " (%s)") ${bold_black}シ${normal} "
}

PROMPT_COMMAND=prompt_command;
