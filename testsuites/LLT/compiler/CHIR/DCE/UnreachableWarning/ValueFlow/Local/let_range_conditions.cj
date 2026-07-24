// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify direct and nested range contradictions for a let value.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() {
    let limit = 10
    if (limit > 100) {
        println("unreachable let comparison")
    }

    if (limit > 0) {
        if (limit < 0) {
            println("unreachable range contradiction")
        }
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> let_range_conditions.cj:13:22:
   | 
13 |       if (limit > 100) {
   |  ______________________^
14 | |         println("unreachable let comparison")
15 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> let_range_conditions.cj:18:24:
   | 
18 |           if (limit < 0) {
   |  ________________________^
19 | |             println("unreachable range contradiction")
20 | |         }
   | |_________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
