// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that an unreachable successor does not recursively enter the shared
// continuation and report the reachable second if at any optimization level.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %f -O0 -o %output
// EXEC: %compiler %cmp_opt %f -O1 -o %output
// EXEC: %compiler %cmp_opt %f -O2 -o %output

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

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_reassignment_continuation.cj:25:16:
   | 
25 |       if (false) {
   |  ________________^
26 | |         println("constant")
27 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
