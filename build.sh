#!/bin/bash

build_conf="$(echo "$1" | tr [:upper:] [:lower:])"

if [ "$2" = "" ]; then
	build_platform="x86"
else
	build_platform="$(echo "$2" | tr [:upper:] [:lower:])"
fi

if [ "$1" = "" ]; then
	xbuild /p:Configuration="Debug" /p:Platform=$build_platform LuaInterface.sln
else
	if [ $build_conf = "release" ]; then
		xbuild /p:Configuration="Release" /p:Platform=$build_platform LuaInterface.sln
	else
		xbuild /p:Configuration="Debug" /p:Platform=$build_platform LuaInterface.sln
	fi
fi
