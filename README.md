# os-autoinst-perl-tidy

## Description
Dockerized version of tool tidy used in project os-autoint for perl code. (https://github.com/os-autoinst/os-autoinst)

## Docker image
Find it here: https://hub.docker.com/r/binarysequence/os-autoinst-perl-tidy/

## Use

```bash
# Pull image
docker pull binarysequence/os-autoinst-perl-tidy:2018-03-05_2018-02-20

# Run container to check (files won't be changed)
docker container run -v /Users/sergio/github/os-autoinst-distri-opensuse/:/tmp/mess binarysequence/os-autoinst-perl-tidy:2018-03-05_2018-02-20

# Run container to edit files in place
docker container run -v /Users/sergio/github/os-autoinst-distri-opensuse/:/tmp/mess binarysequence/os-autoinst-perl-tidy:2018-03-05_2018-02-20 --replace

# The volume is the project that you want to tidy (os-autoinst, os-autoinst-distri-opensuse, etc)
```

## Pitfalls

#### Write permissions

The container executes the tidy as the user nobody with **uid=482**.
Probably, the directory on your machine, cannot be written by that user.

Assuming that the directory (and subdirectories) are writable by your user, find your user id (uid) and let the container use your privileges.

```bash
# Find your uid
id
# Output example: uid=1000(sergio) gid=100(users) groups=100(users),468(docker),469(vboxusers),1000(developers)

# I assume that the directory has write permissions for your user, if not, the following will not work
# --user 1000
docker container run --user 1000 -v /home/mansilla/github/os-autoinst-distri-opensuse/:/tmp/mess binarysequence/os-autoinst-perl-tidy:2018-03-05_2018-02-20 --replace
```

In my case, I have mit github code directy in used by a local openQA instance and have the user geekotest as owner. So in my case I have to find the uid of geekotest and give the container the privileges as geekotest.

```bash
# Find uid
id geekotest
# Output example: uid=489(geekotest) gid=65534(nogroup) groups=1000(developers),65534(nogroup)
docker container run --user 489 -v /home/mansilla/github/os-autoinst-distri-opensuse/:/tmp/mess binarysequence/os-autoinst-perl-tidy:2018-03-05_2018-02-20 --replace
```
