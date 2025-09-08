// DEPENDENCE: pkg.old.cj pkg.new.cj
// EXEC: %cpfile pkg.old.cj pkg.inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.inc.cj %compile_lib_opt -o pkg.%lib_extension
// EXEC: %cpfile pkg.new.cj pkg.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt pkg.inc.cj %compile_lib_opt -o pkg.%lib_extension 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// EXEC: %compiler %cmp_opt pkg.%lib_extension %f -o %output
// EXEC-1: %run %run_opt %output %run_args

internal import pkg.*

main() {
    test<Int64>()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
