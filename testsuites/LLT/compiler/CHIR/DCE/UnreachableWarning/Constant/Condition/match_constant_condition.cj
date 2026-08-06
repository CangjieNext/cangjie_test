// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a constant condition remains diagnosed inside a reachable match case.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func matchBody(value: Bool) {
    match (value) {
        case true =>
            if (true) {
                println("reachable match body")
            } else {
                println("unreachable match body")
            }
        case false => println("other match body")
    }
}

main() {
    matchBody(true)
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> match_constant_condition.cj:16:20:
   | 
16 |               } else {
   |  ____________________^
17 | |                 println("unreachable match body")
18 | |             }
   | |_____________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
