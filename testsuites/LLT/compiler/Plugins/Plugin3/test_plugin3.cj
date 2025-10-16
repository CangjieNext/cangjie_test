// DEPENDENCE: p1 p2
// (CJNATIVE and Linux)EXEC: %cd p1 && %rmdir build && %mkdir build && %cd build && cmake .. && make clean && make && make install
// (CJNATIVE and Linux)EXEC: %cd p2 && %rmdir build && %mkdir build && %cd build && cmake .. && make clean && make && make install
// (CJNATIVE and Linux)RUN-EXEC-PIPE: export LD_LIBRARY_PATH=./p1/output:$LD_LIBRARY_PATH && %compiler %cmp_opt %f --plugin=./p2/output/libmyplugin.%dylib_suffix --plugin=./p1/output/libmyplugin.%dylib_suffix -o %output 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan funcs\nFound 1 Package
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
