## About

This is a bash script that generates secure passwords using 1password's cli application.
Requires a 1password account to use.

The script is a wrapper for 1password's `op item create` utility that generates passwords by using the `--dry-run`
option which allows us to generate a password without actually saving it. It will generate a random password that
consists of letters and numbers. By default it will generate one password of length 20, but the desired length and
number of passwords can be provided by cli arguments

## Installation

Run the following to install to your user's private bin:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/op-genpass/install.sh | bash
```

or alternatively you can run this to install globally for all users:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/op-genpass/install.sh | sudo bash
```
