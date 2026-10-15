// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify optimized enum tables retain if-let and while-let diagnostic sources.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt -O2 %f -o %output

enum State {
    | Active(Int64, Int64)
    | Stopped
}

main() {
    const active = State.Active(1, 2)
    if (let Active(1, _) <- active) {
        println("active")
    } else {
        println("unreachable else")
    }

    const stopped = State.Stopped
    while (let Active(1, 2) <- stopped) {
        println("unreachable while body")
        break
    }
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> enum_table_condition_source.cj:20:12:
   | 
20 |       } else {
   |  ____________^
21 | |         println("unreachable else")
22 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'while' expression
  ==> enum_table_condition_source.cj:25:16:
   | 
25 |     while (let Active(1, 2) <- stopped) {
   |                ^^^^^^^^^^^^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
