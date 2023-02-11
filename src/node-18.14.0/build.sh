#!/bin/bash

CWD=$(pwd)

. /env.sh

cd $CWD/src

make distclean

./configure --dest-cpu=arm --dest-os=linux --prefix=$TOOLCHAIN_BUILD_PREFIX/node18
#--cross-compiling 
#--sysroot=${TOOLCHAIN_SYSROOT}


# ../deps/v8/src/compiler/node.h :   
# FROM constexpr IrOpcode::Value opcode() const {
# TO IrOpcode::Value opcode() const {

# ../deps/v8/src/compiler/js-operator.h :   
# FROM static constexpr bool IsValidNode(Node* node) { 
# TO static bool IsValidNode(Node* node) { 

# ../deps/v8/src/compiler/operator.h :   
# FROM constexpr Opcode opcode() const { return opcode_; }
# TO Opcode opcode() const { return opcode_; }

# make -j$(nproc)
make
make install


$STRIP $TOOLCHAIN_BUILD_PREFIX/node18/bin/node
file $TOOLCHAIN_BUILD_PREFIX/node18/bin/node
