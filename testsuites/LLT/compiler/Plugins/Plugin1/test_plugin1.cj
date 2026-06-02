// DEPENDENCE: CMakeLists.txt src
// (CJNATIVE and Linux)EXEC: %rmdir build && %mkdir build && %cd build && cmake .. && make clean && make && make install
// (CJNATIVE and Linux)RUN-EXEC-PIPE: %ls ./output && export LD_LIBRARY_PATH=./output:$LD_LIBRARY_PATH && %compiler %cmp_opt %f --plugin=./output/libmyplugin1.%dylib_suffix %incrementalCompile -o %output 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan libcangjie-lsp.so
// (CJNATIVE and Linux)ASSERT: scan libmyplugin1.so
// (CJNATIVE and Linux)ASSERT: scan `--incremental-compile` is incompatible with `--plugin` and will be ignored
// (CJNATIVE and Linux)ASSERT: regex Found [0-9]+ funcs
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
