#!/usr/bin/env python3

import os
import string
import sys


def main(length: int):
    charset = string.ascii_letters + string.digits + "!" + "$"

    password = ""

    while len(password) < length:
        index = ord(os.urandom(1)) % len(charset)
        password += charset[index]

    print(password)


if __name__ == "__main__":
    try:
        if len(sys.argv) > 1:
            length = int(sys.argv[1])
        else:
            length = 20
    except IndexError:
        print("A length value is required")
    except ValueError:
        print("Please provide a valid number")
    else:
        main(length)
