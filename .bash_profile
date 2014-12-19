#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# stop nagging me about ssh key passphrase
eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
