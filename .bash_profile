#
# This file (.bash_profile) is read by each new login shell of bash
#
# There are comments to explain most of what is done
#
# $Id: .bash_profile,v 1.1 2006/06/12 14:03:24 stefan Exp $
#
# To make the file writable so you can make changes, you need 
# to use the "chmod" command to change the file permissions to
# the following.  Use the command "man chmod" to find out how.
#
# -rwxr-xr-x   1 myname      3481 Jul 23 13:43 .bash_profile

# We check here to see if we're running on Windows NT.  We set the
# 's' environment variable to what the correct prefix should be, and
# for NT set some useful key bindings

if [ -n "$OS" ]; then
    if [ "$OS" = "Windows_NT" ]; then
        export s=s:
        bind N-up: up-history
        bind N-down: down-history
        bind N-right: forward-char
        bind N-left: backward-char
        bind N-del: delete-char
        bind N-ins: overwrite-mode
        bind N-1: which-command
        bind N-2: expand-history
        bind N-3: complete-word-raw
        bind N-home: beginning-of-line
        bind N-end: end-of-line
    fi
else
    export s="/s"
fi

# Your path is the order of the directories in which your shell looks 
# for programs.  
#
# Software is now being installed in /s/package-name. To use a
# particular pacakge, put /s/package-name/bin in your path (in most
# cases).
# 
# the "std" package has most of the software from /s, so /s/std/bin will
# probably give you everything you want.
#
# /s/std/bin is BEFORE the common unix directory so that the improved
# versions of the standard software are used. If you want the vendor
# versions, either move /s/std/bin after /bin, /usr/bin, /usr/ucb, or
# use aliases or symlinks in your ~/bin.

#
# Set the initial path here:
# MAKE CHANGES IN ~/.bashrc
#

# if on a system that doesn't define USER by default, set it here so
# that we don't have to test for it every time
if [ -z $USER ]; then
    export USER=${LOGNAME}
fi

#umask 027
#stty crt kill ^U erase ^H susp ^Z
# get users's personal aliases, etc
#. $HOME/.bash-vars

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

