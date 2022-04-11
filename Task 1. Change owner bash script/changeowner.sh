#!/bin/bash
set -e

# Set variables
user=$1
mydir=$2

# Stage 1: Check premissions
if [ "$EUID" -ne 0 ] ;
  then 
   echo "$(tput setaf 1)[Error:] $(tput setaf 7)Please run as root"
  exit 1
fi

# Stage 2: Check parameters count
if [ $# != 2 ] ; 
  then
   echo "$(tput setaf 1)[Error:] $(tput setaf 7)Illegal number of parameters - $#. Please add only 2 parameters - <user> <dir>" >&2
  exit 1
fi

# Stage 3: Check the user exist
if ! id -u "$user" >/dev/null 2>&1 
  then
   echo "$(tput setaf 1)[Error:] $(tput setaf 7)The user '$user' does not exists."
  exit 1
fi

# Stage 4: Check the directory exist
if [ ! -d "$mydir" ] ; then 
   echo "$(tput setaf 1)[Error:] $(tput setaf 7) The directory $mydir does not exists."
  exit 1
fi

# Stage 5: Change owner
  chown -R "$user" "$mydir"
   echo "$(tput setaf 2)[Sucsess:] $(tput setaf 7)The owner of the $(tput setaf 5)$mydir $(tput setaf 7)has been changed to user $(tput setaf 3)$user"

