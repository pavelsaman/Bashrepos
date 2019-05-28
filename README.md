# Bashrepos

Bashrepos is a tool for finding all local git repositories. In addition to just finding where all my local git repos are, it also finds what branches exist in all of these repos.

Simple cache file (.gitlocalrepos) is located in $HOME, making it faster to retrieve information.

# Example Usage
```
$ bashrepos.bash u /home/pavel
$ bashrepos.bash l
```
# Shell Commands
```
$ bashrepos.bash u[pdate] [dir] - updates local git repos from the current dir down, or from the dir provided down 
$ bashrepos.bash l[ist] - lists cached local git repos ($HOME/.gitlocalrepos) and all repo branches (repo#current_branch#all_other_branches)
$ bashrepos.bash s[earch] REPO/BRANCH - searches for a local git repo or any of the branches in the cache file
$ bashrepos.bash h
```
# Autocompletion
Add the following line into your .bashrc or similar:
```
source /path-to-script/bashrepos-completion.bash
```
