// DEPENDENCE: CMakeLists.txt src
// (CJNATIVE and Linux)EXEC: %rmdir build && %mkdir build && %cd build && cmake .. && make clean && make && make install
// (CJNATIVE and Linux)RUN-EXEC-PIPE-1: %compiler %cmp_opt %f --plugin=./output/libmyplugin2.%dylib_suffix -o %output 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: regex (is not a valid compiler plugin to be loaded or executed) | (exception occurs while executing compiler plugin\(s\))
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

private func goo() {
    5
}

func foo() {
    5
}

main() {
    goo()
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
