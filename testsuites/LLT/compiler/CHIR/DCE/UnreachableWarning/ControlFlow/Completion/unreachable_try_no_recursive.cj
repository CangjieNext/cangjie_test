// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify an unreachable all-terminating try does not create a nested warning.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func unreachableTryDoesNotRecurse(): Int64 {
    return 1
    // EXPECT: chir_dce_unreachable_expression_hint
    try {
        throw Exception()
    } catch (_: Exception) {
        throw Exception()
    }
    println("unreachable successor")
    return 2
}

main() {
    unreachableTryDoesNotRecurse()
}

/* SCAN-IN
warning: unreachable expression
  ==> unreachable_try_no_recursive.cj:13:5:
   | 
11 |       return 1
   |       ~~~~~~~~ any code following this expression is unreachable
12 |       // EXPECT: chir_dce_unreachable_expression_hint
13 |       try {
   |  _____^
14 | |         throw Exception()
   | | ...
17 | |     }
   | |_____^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
