# zmodload zsh/zprof # enable this line, use zprof to see zsh function load time
[[ -r ~/.config/zsh/zsh-snap ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/zsh-snap
source ~/.config/zsh/zsh-snap/znap.zsh
export EDITOR=nvim

znap eval starship 'starship init zsh'
znap prompt

znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions

# fnm & zoxide
znap eval fnm 'fnm env --shell zsh'
znap eval zoxide 'zoxide init zsh --cmd z'
znap eval atuin 'atuin init zsh --disable-up-arrow'

zstyle ':znap:*:*' git-maintenance off

# alias
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -lG'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias zshrc='nvim ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias t='tail -f'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias ff='find . -type f -name'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias y='yazi'

list-jdk() {
    /usr/libexec/java_home -V
}

set-jdk() {
    if [ $# != 1 ]; then
        echo "usage example: set-jdk 1.8"
        return 1
    fi
    unset JAVA_HOME
    export JAVA_HOME=`/usr/libexec/java_home -v $1`
    export PATH=$JAVA_HOME/bin:$PATH
}
