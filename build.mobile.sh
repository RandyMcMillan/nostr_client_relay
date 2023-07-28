#!/bin/bash
mkdir -p build
pushd build
if [[ "$OSTYPE" == "linux-gnu"* ]]; then

cmake .. -DBUILD_MOBILE=ON

elif [[ "$OSTYPE" == "darwin"* ]]; then

cmake .. -DBUILD_MOBILE=ON \
-DCMAKE_PREFIX_PATH=$QT_IOS_DIR \
-DDEPLOYMENT_TARGET=12.0 \
-DPLATFORM=OS64COMBINED \
-DENABLE_BITCODE=FALSE \
-DCMAKE_BUILD_TYPE=Release \
-DAPPLE_IOS_TARGET=True \
-DQT_HOST_PATH=/Users/pvn/Qt6.5.2/6.5.2/macos \
-DQT_DEBUG_FIND_PACKAGE=ON \
-G Xcode \
-DCMAKE_TOOLCHAIN_FILE=mobile/ios.toolchain.cmake \
-DPLATFORM=OS64

elif [[ "$OSTYPE" == "msys" ]]; then

cmake .. --fresh -DBUILD_MOBILE=ON 

fi

cmake --build . --config Release

popd
pwd