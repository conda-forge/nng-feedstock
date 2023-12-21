#!/bin/bash
mkdir build

if [[ "$target_platform" == osx-arm64 ]]; then
	cmake -B build -S . \
		${CMAKE_ARGS} \
                -G Ninja \
                -DBUILD_SHARED_LIBS=ON \
                -DNNG_ENABLE_TLS=ON \
		-DCMAKE_INSTALL_PREFIX=$PREFIX \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_VERBOSE_MAKEFILE=ON \
		-DENABLE_TESTING=Off

else
	cmake -B build -S . \
		${CMAKE_ARGS} \
                -G Ninja \
                -DBUILD_SHARED_LIBS=ON \
                -DNNG_ENABLE_TLS=ON \
		-DCMAKE_INSTALL_PREFIX=$PREFIX \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_VERBOSE_MAKEFILE=ON
fi

cd build
ninja
if [[ -z "$MACOSX_DEPLOYMENT_TARGET" ]] && [[ "{$target_platform}" != "linux_aarch64" ]] && [[ "{$target_platform}" != "linux_ppc64le" ]]; then
    ninja test
fi
ninja install
