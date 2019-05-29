#!/bin/bash 

# The following script finds all git local repos under the current/provided dir,
# attaches current and all other branches to each repo and saves it all into a file in $HOME.
# Therefore one can easily see all local repos with only one command (bashrepos.bash l),
# or search for local repos or branches.

cache_file_name=".gitlocalrepos"
repos_cache="${HOME}/${cache_file_name}"

function update {
	# start searching from the current dir or from the dir provided in a parameter
	start_search_dir="$1"
	[[ -z $1 ]] && start_search_dir="$(pwd)"
	
	# new cache file
	/bin/rm "$repos_cache" 2>/dev/null
	touch "$repos_cache"

	# find all local repos
	for repo in $(find "$start_search_dir" -type d -name .git 2>/dev/null); do
		# take away last dir, that is .git
		repo=$(dirname "$repo")
		# find the current branch of the repo
		if [[ -x $repo ]]; then
			cd "$repo" || exit 1
			current_branch=$(git branch | grep -E "^[*]{1}.*" | cut -d' ' -f 2)
			# get all branches, not only the current one
			all_branches=""
			for branch in $(git branch | sed -n -E 's/(.{2})(.*)$/\2/ p'); do
				if [[ $branch != $current_branch ]]; then
					all_branches+="#$branch"
				fi
			done
		fi
		
		# generate cache
		[[ -n $current_branch ]] && echo "${repo}#${current_branch}${all_branches}" >> "$repos_cache" || echo "$repo" >> "$repos_cache"
	done
}

function search {
	_check_cache_file
	
	[[ -z $1 ]] && _check_help

	echo ""
	# try to find local repos in cache
	c_match=$(grep "$1" "$repos_cache")
	if [[ -n $c_match ]]; then # if there's a match
		printf "location#current_branch#another_branch#another_branch_2#...\n\n"

		for repo in $c_match; do # print all matched local repos from cache
			echo "$repo"
		done
	else
		echo "$1 is not a local repo."
	fi
	echo ""
}

function list {
	_check_cache_file
	
	echo ""
	# list all local repos from cache, current repo in green
	if [[ -s $repos_cache ]]; then
		printf "location#current_branch#another_branch#another_branch_2#...\n\n"
		cat "$repos_cache"
	else
		echo "Local cache is empty."
	fi
	echo ""
}

function _check_cache_file {
	# checks for existence of cache and prints a message if cache doesn't exist
	if [[ ! -f $repos_cache ]]; then
		printf "\nLocal cache doesn't exist, run u [dir] first."
		_check_help
	fi									
}

function _check_help {
	echo ""
	echo "u[pdate] [dir] - updates local git repos from the current dir down, or from the dir provided down"
	echo "l[ist] - lists cached local git repos ($HOME/.gitlocalrepos) and all repo branches (repo#current_branch#all_other_branches)"
	echo "s[earch] REPO/BRANCH - searches for a local git repo or any of the branches in the cache file"
	kill -SIGINT $$
}

case $1 in
	h | H | -h | -H | help | HELP | --help | --HELP)
		_check_help
		;;
	u | U | update)
		update "$2"
		;;
	s | S | search)
		search "$2"
		;;
	l | L | list)
		list "$2"
		;;
	*)
		_check_help
		;;
esac
