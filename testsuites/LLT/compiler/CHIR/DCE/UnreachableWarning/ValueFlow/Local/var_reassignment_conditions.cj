// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the latest var assignment drives range analysis.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    var reassigned = 10
    reassigned = 20
    if (reassigned > 100) {
        println("unreachable var reassignment")
    }

    var tracked = 10
    tracked = 3
    if (tracked > 5) {
        println("unreachable var tracking")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> var_reassignment_conditions.cj:14:27:
   | 
14 |       if (reassigned > 100) {
   |  ___________________________^
15 | |         println("unreachable var reassignment")
16 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> var_reassignment_conditions.cj:20:22:
   | 
20 |       if (tracked > 5) {
   |  ______________________^
21 | |         println("unreachable var tracking")
22 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
