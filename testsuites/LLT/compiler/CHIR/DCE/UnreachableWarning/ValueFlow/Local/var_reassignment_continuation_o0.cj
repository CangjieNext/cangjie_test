// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the var continuation recursion boundary at O0.
// EXEC-PIPE-0: %compiler %cmp_opt %f -O0 -o %output 2>&1 | compare %f


main() {
    var judge = true
    if (judge) {
        println("first")
    }

    judge = false
    if (!judge) {
        println("second")
    }

    if (false) {
        println("constant")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> var_reassignment_continuation_o0.cj:22:16:
   | 
22 |       if (false) {
   |  ________________^
23 | |         println("constant")
24 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
