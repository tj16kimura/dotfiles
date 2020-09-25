alias ls='ls -FG --color=auto'
alias la='ls -a'
alias ll='ls -l'

# for c++
alias g='g++ -o a'
alias a='./a'

# prompt
function str_with_color() {
	if [ $# -eq 2 ]; then
		echo "%{${fg[$1]}$2${reset_color}%}"
	elif [ $# -eq 3 ]; then
		echo "%{${fg[$1]}${bg[$2]}$3${reset_color}%}"
	fi
}

ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_MODIFIED="M"
# ZSH_THEME_GIT_PROMPT_RENAMED
ZSH_THEME_GIT_PROMPT_DELETED="x"
# ZSH_THEME_GIT_PROMPT_STASHED
# ZSH_THEME_GIT_PROMPT_UNMERGED
ZSH_THEME_GIT_PROMPT_AHEAD=">"
ZSH_THEME_GIT_PROMPT_BEHIND="<"
# ZSH_THEME_GIT_PROMPT_DIVERGED

function my-git-status() {
	if [ $(current_branch) ]; then
		INIT_TRIANGLE="$(str_with_color black yellow '\uE0B0')"
		BRANCH_NAME="$(current_branch)"
		GIT_STATUS=" \uE0A0 $BRANCH_NAME [$(git_prompt_status)] "
		GIT_STATUS="$(str_with_color black yellow $GIT_STATUS)"
		END_TRIANGLE="$(str_with_color yellow '\uE0B0')"
	else
		INIT_TRIANGLE="$(str_with_color black '\uE0B0')"
		GIT_STATUS=""
		END_TRIANGLE=""
	fi
	echo "$INIT_TRIANGLE$GIT_STATUS$END_TRIANGLE"
}

# プロンプト表示をカスタマイズ
function random-emoji {
  # 🚀 🔥 🐉 🐛 🐈 🎱 🎲 ⚡
  candidates=("\U1F680" "\U1F525" "\U1F409" "\U1F41B" "\U1F408" "\U1F3B1" "\U1F3B2" "\u26A1")
  export EMOJI="${candidates[$(($RANDOM % ${#candidates[@]})) + 1]}"
}

random-emoji

function pmt {
	HOST="$(str_with_color black cyan '%B %n@%m %b')$(str_with_color cyan black '\uE0B0')"
	DIR="$(str_with_color cyan black ' %~ ')"
	echo "\n${HOST}${DIR}`my-git-status`\n${EMOJI} "
}
# # RPROMPT=""
PROMPT='`pmt`'

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fuzzy cd
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

typeset -U path PATH
