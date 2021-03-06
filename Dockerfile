FROM opensuse/tumbleweed
LABEL maintainer Sergio Lindo Mansilla <sergiolindo.empresa@gmail.com>

RUN zypper --gpg-auto-import-keys ref
RUN zypper --non-interactive dup
RUN zypper --non-interactive in --force-resolution shadow
RUN zypper --non-interactive in --force-resolution which
RUN zypper --non-interactive in --force-resolution perl-Perl-Tidy-20200110
RUN groupadd -r nogroup
RUN useradd -r -g nogroup nobody

COPY tool/.perltidyrc /etc/os-autoinst/
COPY tool/tidy.sh /usr/local/bin/

USER nobody:nogroup
WORKDIR /tmp/mess
ENTRYPOINT [ "tidy.sh" ]

