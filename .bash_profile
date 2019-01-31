source /Users/ablexxive/git-completion.bash
j() {
    pprint_json $1 | lolcat
}

export PATH="$HOME/.cargo/bin:$PATH"

# Use jq to reset outputs of ipynb to play nice with git
# http://timstaley.co.uk/posts/making-git-and-jupyter-notebooks-play-nice/
alias nbstrip_jq="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

alias l='ls -G'
alias k=kubectl
eval $(thefuck --alias)
