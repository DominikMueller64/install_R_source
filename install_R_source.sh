#!/bin/bash

# Script for installing R from source
# To achieve an optimal build, add the necessary flags to ./configure in this script.
# See: https://stackoverflow.com/questions/8343686/how-to-install-2-different-r-versions-on-debian#comment10292265_8344873
#
# Resources:
#
# https://stackoverflow.com/questions/8343686/how-to-install-2-different-r-versions-on-debian
# https://stackoverflow.com/questions/24019503/installing-multiple-versions-of-r
# https://support.rstudio.com/hc/en-us/articles/215488098-Installing-multiple-versions-of-R
# http://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installation

# exit on error
set -e

R_VERSION=$1

# Create temporary directory
mkdir -p $HOME/R_tmp
cd $HOME/R_tmp

# Download and extract R source
echo Downloading R source
wget https://cran.r-project.org/src/base/R-3/R-${R_VERSION}.tar.gz
tar xvzf R-${R_VERSION}.tar.gz
rm R-${R_VERSION}.tar.gz

# Configure and make
cd R-${R_VERSION}
./configure --prefix=/usr/local/R/${R_VERSION}
make
sudo make install

# Cleanup
cd ../..
rm -rf $HOME/R_tmp

# Create symbolic link
sudo ln -s /usr/local/R/${R_VERSION}/bin/R /usr/bin/R-${R_VERSION}

echo The R-${R_VERSION} executable is now available in /usr/bin/R-${R_VERSION}
