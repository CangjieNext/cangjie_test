// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the successor of an all-return if/else is unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func returnsEveryBranch(value: Bool): Int64 {
    if (value) { return 1 } else { return 2 }
    println("unreachable after all-return if")
    return 3
}

main() {
    returnsEveryBranch(true)
}

/* SCAN
warning: unreachable expression
  ==> if_else_all_return.cj:12:5:
   | 
11 |     if (value) { return 1 } else { return 2 }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
12 |     println("unreachable after all-return if")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
