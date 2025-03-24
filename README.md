# Dotfiles

## Installation ( git bare repository )

This git bare configuration was made with the following approach / tutorial

- Approach by StreakyCobra: https://news.ycombinator.com/item?id=11071754
- Tutorial by durdn https://www.atlassian.com/git/tutorials/dotfiles

1. Configure / ignore git bare directory
```
echo ".dotfiles" >> .gitignore
```
2. Clone this repository > Home .dotfiles directory 
```
git clone --bare https://github.com/exrol/dotfiles.git $HOME/.dotfiles
```

3. Open a shell / alias dotfiles command
```
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
```

4. Apply configuration
```
dotfiles checkout
```

Manage the following error by making a backup or removing concerned files

> error: The following untracked working tree files would be overwritten by checkout:
>     .bashrc
>     .gitignore
> Please move or remove them before you can switch branches.
> Aborting

Backup script for concerned files (optionnal)
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
