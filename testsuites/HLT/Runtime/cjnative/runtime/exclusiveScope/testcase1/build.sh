#!/usr/bin/env bash
set -e

ROOT_DIR=$(cd "$(dirname "$0")" && pwd)
echo $ROOT_DIR
CANGJIE_DIR=$ROOT_DIR/cj
CPP_DIR=$ROOT_DIR/cpp
JAVA_DIR=$ROOT_DIR/java
BUILD_DIR=$ROOT_DIR/build

rm -rf $BUILD_DIR

mkdir -p "$BUILD_DIR/classes"
mkdir -p "$BUILD_DIR/lib"

export LD_LIBRARY_PATH=$BUILD_DIR/lib:$LD_LIBRARY_PATH

echo $CANGJIE_HOME
export CANGJIE_HOME=$ROOT_DIR/cangjie_sdk
source $CANGJIE_HOME/envsetup.sh

cp $CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative/libcangjie-runtime.so $BUILD_DIR/lib
cp $CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative/libsecurec.so  $BUILD_DIR/lib

clang++ -std=c++17 -fPIC -shared "$CPP_DIR"/call_cangjie.cpp  -I$CPP_DIR -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" -o "$BUILD_DIR/lib/libjni_native.so" \
  -L$BUILD_DIR/lib -lcangjie-runtime -lsecurec -pthread

cjc $CANGJIE_DIR/javaCallcj.cj --output-type=dylib --output-dir $BUILD_DIR/lib -L$BUILD_DIR/lib -ljni_native


javac -d build/classes java/*.java
java -Djava.library.path=build/lib -cp build/classes Main

# java \
# -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 \
# -Djava.library.path=build/lib \
# -cp build/classes \
# Main

# jdb -attach 5005
