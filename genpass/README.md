## About

This is a python based password generator that should be relatively cryptographically secure

The script accepts a single optional command line argument that specifies the length of the password to be generated. If no value is provided, a password of length 20 will be generated

This generator works by using `os.urandom()` (which is considered cryptographically secure) to generate a random index between 0 and 63. One byte is obtained from `os.urandom()` and the value is then reduced modulo 64. The resulting value is unbiased as 64 is a divisor of 256 (the max value of a single byte). If the charset used is not a divisor of 256, then the modulo operation will be inherently biased towards the beginning of the charset.

There is also a script called distribution.py provided which demonstrates the index appearance rate based on the above method. Given a charset of 64 characters and a large number of iterations, each index should have an appearance rate of approximately %1.56. If a charset smaller than 64 is used, then the characters at the beginning of the charset will appear more frequently. A charset larger than 64 will result in the characters at the end of the charset appearing less frequently. In either case, this results in a bias towards the characters at the beginning of the charset.

At any rate, this should be sufficient for the majority of typical. However, it's not necessarily strong in all cases, nor can it be considered truely cryptographically secure. If you need actual cryptographic security, please use an open source cryptographically secure random password generator. As an example the op-genpass utility in this repository provides this by using 1password's random password generator to generate passwords

## Installation

Run the following to install to your user's private bin:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/genpass/install.sh | bash

```

or alternatively you can run this to install globally for all users:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/genpass/install.sh | sudo bash
```
