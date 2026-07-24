// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify direct true and false branch selection.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    if (true) {
        println("reachable true branch")
    } else {
        println("unreachable true else")
    }

    if (false) {
        println("unreachable false then")
    } else {
        println("reachable false branch")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> literal_if_conditions.cj:14:12:
   | 
14 |       } else {
   |  ____________^
15 | |         println("unreachable true else")
16 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> literal_if_conditions.cj:18:16:
   | 
18 |       if (false) {
   |  ________________^
19 | |         println("unreachable false then")
20 | |     } else {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
