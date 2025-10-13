// DEPENDENCE: %n.old.cj %n.new.cj Incr.expect.txt
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile --compile-macro %n.inc.cj
// EXEC: %run_macro %compiler %incrementalCompile %cmp_opt %compile_exe_opt %macro_lib %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile --compile-macro %n.inc.cj %output 2>&1 | compare Incr.expect.txt
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %incrementalCompile %compile_exe_opt %macro_lib %f -o %output  2>&1 | compare %f
// ASSERT: regex-auto undeclared identifier 'M' 

import define.*

main() {
    @M[0](0)
    return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
