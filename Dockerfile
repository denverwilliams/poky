FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade

# Install the following utilities (required by poky for C.H.I.P)
RUN apt-get install -y sudo gawk wget git-core diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat libsdl1.2-dev xterm lzop

# Create a non-root user that will perform the actual build
RUN id build 2>/dev/null || useradd --uid 30000 --create-home build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

USER build
RUN mkdir -p /home/build/sh
ADD build.sh /home/build/sh

WORKDIR /home/build/sh
RUN sudo chmod +x build.sh

ENTRYPOINT ["/home/build/sh/build.sh"]