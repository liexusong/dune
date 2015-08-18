#!/bin/sh

# TODO: Check that svn, patch, and make are installed on the system
#setenv CFLAGS "-U_FORTIFY_SOURCE -O2 -fno-stack-protector"
export CFLAGS="-U_FORTIFY_SOURCE -O2 -fno-stack-protector"
svn co svn://svn.eglibc.org/branches/eglibc-2_14 eglibc-2.14
cd eglibc-2.14/libc
cat ../../eglibc-2.14.diff | patch -p2 -d ./
mkdir ../eglibc-build
cd ../eglibc-build
../libc/configure --disable-sanity-checks
make

