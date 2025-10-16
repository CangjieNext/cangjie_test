// DEPENDENCE: %n.old.cj %n.new.cj Incr.expect.txt
// EXEC: %compiler %incrementalCompile --compile-macro %n.old.cj
// EXEC: %run_macro %compiler %incrementalCompile %cmp_opt %compile_exe_opt %macro_lib %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile --compile-macro %n.old.cj 2>&1 | compare Incr.expect.txt
// EXEC: %run_macro %compiler %incrementalCompile %cmp_opt %compile_exe_opt %macro_lib %f -o %output | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan no change

import A.*

main():Int64{
    @M
    var a = 0
    return a
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
