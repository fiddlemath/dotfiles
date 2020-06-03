#### Compose the prompt
# Username, time, curdir
PROMPT='$FG[002]$USER $FG[005]%T $FG[004]%~'

docker_machine_prompt_info() {
    if [ $DOCKER_MACHINE_NAME ]; then
        echo " $FG[004]{dm:$DOCKER_MACHINE_NAME}"
    fi
}

# End of line: git status, newline
PROMPT+='$(git_prompt_info)$(docker_machine_prompt_info)'
PROMPT+='%b%{$reset_color%}
'
# Prompt char.
PROMPT+="%(?.$FG[002].$FG[001])%(!.#.❯)%{$reset_color%} "  #204: Red

ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[004]{git:"
ZSH_THEME_GIT_PROMPT_DIRTY=" $FG[003]✗$FG[004]}"
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[004]}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
