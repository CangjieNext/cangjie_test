// LEVEL: 0
// DEPENDENCE: CMakeLists.txt src
// (CJNATIVE and Linux)EXEC: %mkdir include && %cpfile src/default.txt src/MyPlugin1.cpp
// (CJNATIVE and Linux)EXEC: %rmdir build && %mkdir build && %cd build && cmake .. && make clean && make && make install
// (CJNATIVE and Linux)EXEC: %ls ./output && export LD_LIBRARY_PATH=./output:$LD_LIBRARY_PATH && %compiler %cmp_opt %f --plugin=./output/libmyplugin1.%dylib_suffix -o %output 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan chir checker error

private func goo() {
    0
}

main() {
    goo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
