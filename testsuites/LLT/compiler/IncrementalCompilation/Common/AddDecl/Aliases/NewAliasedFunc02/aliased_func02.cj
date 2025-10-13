// DEPENDENCE: pkg.old.cj pkg.new.cj
// EXEC: %cpfile pkg.old.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt -o pkg.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.%lib_extension %f -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile pkg.new.cj pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %compile_lib_opt %incrementalCompile -o pkg.%lib_extension
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt pkg.%lib_extension %f -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan-not no change
// EXEC-1: %run %run_opt %output %run_args

internal import pkg.f as b

main() : Int64 {
    let v = b()
    return v
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
