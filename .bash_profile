echo "Welcome"

alias gotodesktop="cd C:/Users/micha/Desktop"
alias gotoflutter="cd 'C:/Users/micha/Desktop/Programming/Flutter'"
alias gotoschool="cd C:/Users/micha/Documents/School"
alias gotobots="cd 'C:/Users/micha/Desktop/Programming/Discord Bots'"
alias gotojava="cd 'C:/Users/micha/Desktop/Programming/Java'"
alias gotopython="cd 'C:/Users/micha/Desktop/Programming/Python/Programs'"
alias gotocpp="cd 'C:/Users/micha/Desktop/Programming/C++'"
alias gotoc="cd 'C:/Users/micha/Desktop/Programming/C'"
alias gotoos1="ssh widlerm@os1.engr.oregonstate.edu"
alias gotorabbit="ssh widlerm@rabbit.engr.oregonstate.edu"
alias gotogithub="start firefox 'www.github.com'"
alias gotoflip="ssh widlerm@access.engr.oregonstate.edu"
alias linecountjava="find . -name '*.java' | xargs wc -l"
alias linecountpython="find . -name '*.py' '*.pyw' | xargs wc -l"
alias linecountc="find . -name '*.c' '*.cpp' '*.h' | xargs wc -l"

alias run_lorebot="start node 'C:/Users/Michael/Desktop/Web/Discord Bots/LoreBot/bot.js'"
alias run_charlookup="start 'C:/users/michael/desktop/java/charlookup/charlookup.jar'"
alias run_getsetmaker="start 'C:/users/michael/desktop/java/getsetmaker/getsetmaker.jar'"
alias run_spritesheetinspector="cd 'C:/Users/Michael/Desktop/Programming Resources/'; start spritesheetinspector.jar"
alias run_putty="C:/'Program Files (x86)'/MTPuTTY/mtputty.exe"
alias run_atom="start C:/Users/Michael/AppData/Local/atom/atom.exe"
alias run_jgrasp="cd 'C:/Program Files (x86)/jGRASP/'; start jgrasp.jar"
alias lookbusy="cd c:/users/michael/desktop/java/PAL; ls -l; linecountjava"
alias open_profile="start C:/Users/Michael/.bash_profile"
alias gotowork="start mstsc"
alias reload=". ~/.bash_profile"

export PORT=4000

# function for calling pngcrush
function pngcrush(){
	C:/Users/Michael/Desktop/Programming\ Resources/pngcrush_1_8_11_w32.exe $1 $2
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}] "
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[36m\]@ \w [\A] \`parse_git_branch\`\n> \[\e[m\]"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
