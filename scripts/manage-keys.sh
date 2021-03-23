#!/bin/zsh
# -*- mode: zsh -*-
# Script for managing ssh keys
#
# This script provides a wrapper for
# - creating new keys
# - changing a named key passphrase
# - loading keys into ssh-agent
#

####################################
# Functions

function usage {
    out "usage: $0 create|manage|register <-n <keyname> [-t <keytype>]";
    out "   -c              Create a new key"
    out "   -p              Change the passphrase for a named key"
    out "   -l              Load keys into ssh-agent"
    out "   -n <key name>   The name of the key to manage. Defaults to the short hostname."
    out "   -t <key type>   The type of key to manage. Defaults to 'ed25519'"
    out "   -b <key bits>   The bit length of a new key. Defaults to 4096"
    out "   -h              Show this help message"
}

function out {
    echo "$1" >&1
}

function err {
    echo "! $1" >&2
}

function write_config {

}

function create_key {
    name=$1
    filename=$HOME/.ssh/id_${name}
    type=$2
    bits=$3

    out "creating key '$name'"
    out "   filename : '$filename'"
    out "   type     : '$type'"
    out "   bits     : '$bits'"
    ssh-keygen -b $bits -t $type -f $HOME/.ssh/id_${name}
    if [[ $? -ne 0 ]]; then
        err "something went wrong!!"
        exit 1
    fi
    out "key created at $filename"
}

function change_passphrase {
    name=$1
    filename=$HOME/.ssh/id_${name}

    out "changing passphrase for key '$name'"
    out "   filename : '$filename'"

    ssh-keygen -p -f $filename
    if [[ $? -ne 0 ]]; then
        err "something went wrong!!"
        exit 1
    fi
    out "passphrase $filename"
}

function load_key {
    name=$1
    filename=$HOME/.ssh/id_${name}

    out "loading key '$name' into ssh-agent"
    out "   filename : '$filename'"

    ssh-add $filename
    if [[ $? -ne 0 ]]; then
        err "something went wrong!!"
        exit 1
    fi
    out "passphrase $filename"

}

####################################

####################################
# Variables

key_name=$(/bin/hostname -s)
key_type="ed25519"
key_bits=4096

while getopts ":n:t:hcpl" opt; do
  case $opt in
    n)
        key_name=$OPTARG
        ;;
    t)
        case $OPTARG in
            rsa)
                key_type="rsa"
                ;;
            ed25519)
                key_type="ed25519"
                ;;
            *)
                err "invalid key type $OPTARG"
                err "valid types are : rsa, ed25519"
                exit 1
                ;;
        esac
        # key_type=$OPTARG
        ;;
    b)
        key_bits=$OPTARG
        ;;
    c)
        action="create"
        ;;
    p)
        action="passphrase"
        ;;
    l)
        action="load"
        ;;
    h)
      usage $0
      exit 1
      ;;
    \?)
      usage $0
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [[ -z $action ]]; then
    err "No action provided"
fi

####################################


####################################
# Main loop

case $action in
    create)
        out "creating a new key..."
        create_key $key_name $key_type $key_bits
        exit 0
        ;;
    passphrase)
        out "changing key passphrase..."
        change_passphrase $key_name
        exit 0
        ;;
    load)
        out "loading key into ssh-agent..."
        load_key $key_name
        ;;
    *)
        usage $0
        exit 1
        ;;
esac

exit 0
