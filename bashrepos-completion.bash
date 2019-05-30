#!/usr/bin/env bash

function _bashrepos_completion {
	if (( ${#COMP_WORDS[@]} != 2 )); then
		return
	fi
	
	# show a filtered list after <tab>
	COMPREPLY=($(compgen -W "update list search help" "${COMP_WORDS[1]}"))
}

# bashrepos <tab><tab>
complete -F _bashrepos_completion bashrepos
