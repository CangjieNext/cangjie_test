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

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_reassignment_conditions.cj:13:27:
   | 
13 |       if (reassigned > 100) {
   |  ___________________________^
14 | |         println("unreachable var reassignment")
15 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> var_reassignment_conditions.cj:19:22:
   | 
19 |       if (tracked > 5) {
   |  ______________________^
20 | |         println("unreachable var tracking")
21 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
