// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that an unreachable successor of the first if does not recursively
// enter the shared continuation and report the reachable second if.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// O0/O1/O2 have dedicated files so every optimization mode owns one complete SCAN block.
//
//





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
  ==> var_reassignment_continuation.cj:29:16:
   | 
29 |       if (false) {
   |  ________________^
30 | |         println("constant")
31 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
