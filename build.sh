#!/bin/bash
git clone --branch chip-fido https://gitlab.ii.org.nz/iichip/poky.git /home/build/poky
source oe-init-build-env build-chip
bitbake chip-hwup-image
