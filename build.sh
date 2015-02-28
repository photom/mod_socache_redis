#!/bin/bash

HTTPD_VERSION=2.4.12
APR_VERSION=1.5.1
APRUTIL_VERSION=1.5.4

HTTPD_PKG=httpd-$HTTPD_VERSION
HTTPD_SOURCE=$HTTPD_PKG.tar.gz
HTTPD_SOURCE_URL=http://www.carfab.com/apachesoftware//httpd/$HTTPD_SOURCE

APR_PKG=apr-$APR_VERSION
APR_SOURCE=$APR_PKG.tar.gz
APR_SOURCE_URL=http://apache.claz.org//apr/$APR_SOURCE

APRUTIL_PKG=apr-util-$APRUTIL_VERSION
APRUTIL_SOURCE=$APRUTIL_PKG.tar.gz
APRUTIL_SOURCE_URL=http://apache.claz.org//apr/$APRUTIL_SOURCE

WORK_DIR=`pwd`/work

abort () {
    echo "$1" 1>&2
    exit
}

read -p "build apr? [yes/no]: " BUILD_APR
if [ "x$BUILD_APR" = "xyes" ] ; then
    rm -f $APR_SOURCE
    http_proxy=$PROXY wget $APR_SOURCE_URL     || abort "failed to get apr source"

    tar xzf $APR_SOURCE
    pushd $APR_PKG
    ./configure --prefix=$WORK_DIR && make && make install || abort "failed to build apr"
    popd
else
   echo "skip build apr"
fi

read -p "build apr-util? [yes/no]: " BUILD_APRUTIL
if [ "x$BUILD_APRUTIL" = "xyes" ] ; then
    rm -f $APRUTIL_SOURCE
    http_proxy=$PROXY wget $APRUTIL_SOURCE_URL || abort "failed to get apr-util source"
    tar xzf $APRUTIL_SOURCE
    pushd $APRUTIL_PKG
    ./configure --prefix=$WORK_DIR --with-apr=$WORK_DIR && make && make install || abort "failed to build apr-util"
    popd
else
   echo "skip build apr-util"
fi

read -p "build httpd? [yes/no]: " BUILD_HTTPD
if [ "x$BUILD_HTTPD" = "xyes" ] ; then
    rm -f $HTTPD_SOURCE
    http_proxy=$PROXY wget $HTTPD_SOURCE_URL   || abort "failed to get httpd source"
    tar xzf $HTTPD_SOURCE
    pushd $HTTPD_PKG
    ./configure --prefix=$WORK_DIR --with-apr-util=$WORK_DIR --with-apr=$WORK_DIR --enable-modules=all --enable-ssl && make && make install || abort "failed to build httpd"
    popd
else
   echo "skip build httpd"
fi

PATH=$PATH:$WORK_DIR/bin apxs -c -i -Wc,-Wall mod_socache_redis.c apr_redis.c
