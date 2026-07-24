// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify constant Boolean and numeric branch selection.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    const enabled = true
    if (enabled) {
        println("reachable const branch")
    } else {
        println("unreachable const else")
    }

    const threshold = 10
    if (threshold > 100) {
        println("unreachable const comparison")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> const_literal_conditions.cj:15:12:
   | 
15 |       } else {
   |  ____________^
16 | |         println("unreachable const else")
17 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> const_literal_conditions.cj:20:26:
   | 
20 |       if (threshold > 100) {
   |  __________________________^
21 | |         println("unreachable const comparison")
22 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
