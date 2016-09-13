#!/bin/bash
git clone --branch chip-fido https://gitlab.ii.org.nz/iichip/poky.git
source oe-init-build-env build-chip
bitbake chip-hwup-image
