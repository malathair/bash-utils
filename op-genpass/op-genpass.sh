#!/bin/bash

usage() {
    echo "usage: $0 [-h] [-l LENGTH] [-n NUMBER]"
    echo ""
    echo "A utility to generate secure passwords with 1password"
    echo ""
    echo "options:"
    echo "  -h    Display this help message and exit"
    echo ""
    echo "  -l    The length of generated passwords"
    echo "  -n    The number of passwords to generate"
    exit 1
}

length=20
number=1

while getopts "hn:l:" opt; do
    case ${opt} in
        h)
            usage
            ;;
        n)
            number=$OPTARG
            ;;
        l)
            length=$OPTARG
            ;;
        \?)
            usage
            ;;
        :)
            ;;
    esac
done

for i in $(seq 1 $number); do
    op item create                                           \
        --dry-run                                            \
        --category Password                                  \
        --generate-password="letters,digits,$length"         \
        --format json                                        \
        | jq -r '.fields[] | select(.id == "password").value'
done
