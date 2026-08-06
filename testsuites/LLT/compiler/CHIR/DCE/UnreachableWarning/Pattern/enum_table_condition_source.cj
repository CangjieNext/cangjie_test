// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify optimized enum tables retain if-let and while-let diagnostic sources.
// EXEC-PIPE-0: %compiler %cmp_opt -O2 %f -o %output 2>&1 | compare %f

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

/* SCAN
warning: unreachable block in 'if' expression
  ==> enum_table_condition_source.cj:19:12:
   | 
19 |       } else {
   |  ____________^
20 | |         println("unreachable else")
21 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'while' expression
  ==> enum_table_condition_source.cj:24:16:
   | 
24 |     while (let Active(1, 2) <- stopped) {
   |                ^^^^^^^^^^^^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
