## About

This is a python based random password generator that should be relatively cryptographically secure

The script accepts a single optional command line argument that specifies the length of the password to be generated. If no value is provided, a password of length 20 will be generated

For strong passwords, a random generator that produces a uniform distribution is ideal, as the effective entropy is maximized. Random number generators that produce biased distributions reduce the effective entropy of passwords, which allows attackers to exploit the fact that certain characters are more likely to appear.

This random password generator works by using `os.urandom()` (which is considered cryptographically secure) to generate a random index between 0 and 63. One byte is obtained from `os.urandom()` and the value is then reduced modulo 64. The resulting value is unbiased as 64 is a divisor of 256 (the max value of a single byte). If the number of characters in the charset used is not a divisor of 256, then the modulo operation will be inherently biased towards the beginning of the charset.

If you'd like to see the distribution of this generator, a `distribution.py` script is which demonstrates the index appearance rate based on the above method. It accepts to arguments charset_size (number of characters in the charset) and iterations (number of times the generator is used to obtain a charset index). E.g `./distribution.py 64 10_000_000`. I recommend using 10,000,000 as the sample size as it is large enough to approach the true distribution and is still fast enough that it is calculated within a few seconds. By default, the script will set the charset size to 64 and the number of iterations to 10_000_000 if no arguments are provided.

Given a charset of 64 characters and a large number of iterations, each index should have an appearance rate of approximately %1.56. If a charset smaller than 64 is used, then the characters at the beginning of the charset will appear more frequently, with the head of the charset trending towards an appearance rate of %1.95. A charset larger than 64 will result in the characters at the end of the charset appearing less frequently, with the tail of the charset trending towards an appearance rate of %1.17. The exact number of biased characters depends on the size of the charset used with charset sizes closer to a divisor of 256 being more uniform. In any case, use of a charset size that is not a divisor of 256 results in a bias towards the characters at the beginning of the charset, which reduces the entropy of the resulting passwords.

At any rate, this should be sufficient for the majority of typical day to day applications. However, it's not necessarily strong in all cases, nor can it be considered truely cryptographically secure. If you need actual cryptographic security, please use an open source cryptographically secure random password generator.

## Installation

Run the following to install to your user's private bin:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/genpass/install.sh | bash

```

or alternatively you can run this to install globally for all users:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/genpass/install.sh | sudo bash
```
