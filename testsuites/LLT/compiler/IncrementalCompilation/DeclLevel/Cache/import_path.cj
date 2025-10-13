// DEPENDENCE: pkg.cj Full.expect NoChange.expect
// EXEC: %mkdir inc outputDir1
// EXEC: %cpfile pkg.cj inc
// EXEC: %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt --output-dir outputDir1 -o A.%lib_extension 2>&1 | compare Full.expect
// EXEC: %compiler %cmp_opt %incrementalCompile %f outputDir1/A.%lib_extension --import-path outputDir1 -o %output
// EXEC-5: %run %run_opt %output %run_args

// EXEC: %cpdir outputDir1 outputDir2
// EXEC: %compiler %cmp_opt %incrementalCompile %f outputDir2/A.%lib_extension --import-path outputDir2 -o %output | compare NoChange.expect
// EXEC-5: %run %run_opt %output %run_args

internal import inc.foo

main() {
    return foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
