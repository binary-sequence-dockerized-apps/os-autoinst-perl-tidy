# os-autoinst-perl-tidy

## Description
Dockerized version of tool tidy used in project os-autoint for perl code. (https://github.com/os-autoinst/os-autoinst)

## Docker image
Find it here: https://hub.docker.com/r/binarysequence/os-autoinst-perl-tidy/

## Use

```bash
# Pull image
docker pull binarysequence/os-autoinst-perl-tidy:20180222-20180101

# Run container to check (files won't be changed)
docker container run -v /Users/sergio/github/os-autoinst-distri-opensuse/:/tmp/mess binarysequence/os-autoinst-perl-tidy:20180222-20180101

# Run container to edit files in place
docker container run -v /Users/sergio/github/os-autoinst-distri-opensuse/:/tmp/mess binarysequence/os-autoinst-perl-tidy:20180222-20180101 --replace

# The volume is the project that you want to tidy (os-autoinst, os-autoinst-distri-opensuse, etc)
```
