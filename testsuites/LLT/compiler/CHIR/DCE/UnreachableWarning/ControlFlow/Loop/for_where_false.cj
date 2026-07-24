// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false for-in where clause makes the loop body unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    for (_ in 0..3 where false) {
        println("dead for where body")
    }
}

/* SCAN
warning: unreachable block in 'for' expression
  ==> for_where_false.cj:11:33:
   | 
11 |       for (_ in 0..3 where false) {
   |  _________________________________^
12 | |         println("dead for where body")
13 | |     }
   | |_____^ unreachable block in 'for' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
