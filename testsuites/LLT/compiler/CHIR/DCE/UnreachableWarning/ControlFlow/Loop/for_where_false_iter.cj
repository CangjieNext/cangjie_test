// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false iterator for-in where clause makes the loop body unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let values = [1, 2, 3]
    for (_ in values where false) {
        println("dead iterator for where body")
    }
}

/* SCAN
warning: unreachable block in 'for' expression
  ==> for_where_false_iter.cj:12:35:
   | 
12 |       for (_ in values where false) {
   |  ___________________________________^
13 | |         println("dead iterator for where body")
14 | |     }
   | |_____^ unreachable block in 'for' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
