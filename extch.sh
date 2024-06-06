#!/bin/bash

help=false
verbose=false

# Display help message
print_help()
{
    echo "A simple bash script to facilitate bulk extension changes"
    echo
    echo "usage: extch [OPTIONS] [OLD_EXT] [NEW_EXT]"
    echo
    echo "  -h      Print this help message and exit"
    echo "  -v      Verbose Mode"
    echo
}

change_extensions()
{
    if [ $# -le 1 ]; then
        echo "Insufficient parameters provided"
        print_help
        exit 1
    fi

    while [ $# -gt 0 ]; do
        if [ -z "$old_ext" ]; then
            old_ext=$1
            shift
        elif [ -z "$new_ext" ]; then
            new_ext=$1
            shift
        else
            echo "Unexpected argument(s): $@"
            print_help
            exit 1
        fi
    done

    for file in *.$old_ext; do
        if $verbose; then
            echo "Renaming $file to ${file%.$old_ext}.$new_ext"
        fi
        mv -- "$file" "${file%.$old_ext}.$new_ext"
    done
}

args=()
while [ $OPTIND -le "$#" ]; do
    if getopts ":hv" flag; then
        case $flag in
            h)
                help=true
                ;;
            v)
                verbose=true
                ;;
            \?)
                echo "Error: Invalid Option -${OPTARG}"
                print_help
                exit 1;;
        esac
    else
        args+=(${!OPTIND})
        ((OPTIND++))
    fi
done

# Run the rename logic only if the user didn't ask for the help printout
if $help; then
    print_help
else
    change_extensions "${args[@]}"
fi
