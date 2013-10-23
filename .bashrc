# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) # for examples 
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PS1="Sauron@Mordor:$ "

alias idbmysql="/usr/local/Calpont/mysql/bin/mysql --defaults-file=/usr/local/Calpont/mysql/my.cnf -u root"

fortune -e -c | sed 's/%/&\n/g' |cowsay -f tux

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
#export HADOOP_HOME=/home/lavkesh/hadoop/hadoop-0.20.2-cdh3u3
#export PIG_HOME=/home/lavkesh/hadoop/pig-0.8.1-cdh3u3
#export PIG_DIR=/home/lavkesh/hadoop/pig-0.8.1-cdh3u3
export JRUBY_HOME=/home/lavkesh/work/jruby-1.7.4/bin
#export PIG_CLASSPATH=$HADOOP_HOME/lib/hadoop-lzo-0.4.15.jar:$HADOOP_HOME/lib:$HADOOP_HOME/lib/Linux-amd64-64:$HADOOP_HOME/conf
#export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HADOOP_HOME/lib/hadoop-lzo-0.4.15.jar:$HADOOP_HOME/lib:$HADOOP_HOME/lib/Linux-amd64-64:$HADOOP_HOME/conf
export LD_LIBRARY_PATH=/usr/local/lib:$JAVA_HOME/lib
#:$HADOOP_HOME:$HADOOP_HOME/conf:$HADOOP_HOME/lib:$HADOOP_HOME/lib/native/Linux-amd64-64

export PATH=$PATH:$JAVA_HOME/bin:$JRUBY_HOME:$HOME/side_projects/arm-2008q3/bin
#:$HADOOP_HOME/bin:$HADOOP_HOME/lib:$PIG_HOME/bin:$PIG_HOME/lib:/usr/lib/postgresql/8.4/bin:/home/lavkesh/hadoop/thrift-0.5.0/lib:/home/lavkesh/hadoop/zookeeper-3.3.3-cdh3u3/bin:/home/lavkesh/hadoop/hbase-0.90.1-cdh3u3/bin:/home/lavkesh:$PATH:/usr/local/bin/thrift/:/home/lavkesh/hadoop/hbase-0.90.4-cdh3u3/bin:zookeeper-3.3.4-cdh3u3/bin:/usr/local/Calpont/bin

#export CLASSPATH=$HADOOP_HOME/conf/:/home/lavkesh/hadoop/hadoop-0.20.2-cdh3u3/*:/home/lavkesh/hadoop/hadoop-0.20.2-cdh3u3/lib/*:/home/lavkesh/hadoop/hbase-0.90.4-cdh3u3/conf/*:/home/lavkesh/hadoop/zookeeper-3.3.4-cdh3u3/conf/*

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias rm="trash-rm"
alias mvnc="mvn clean install"
