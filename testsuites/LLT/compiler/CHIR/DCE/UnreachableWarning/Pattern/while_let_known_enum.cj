// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A known non-matching enum value makes a while-let body unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum State {
    | Ready
    | Stopped
}

main() {
    let state = State.Stopped
    while (let Ready <- state) {
        println("dead enum while-let body")
    }
}

/* SCAN
warning: unreachable block in 'while' expression
  ==> while_let_known_enum.cj:17:32:
   | 
17 |       while (let Ready <- state) {
   |  ________________________________^
18 | |         println("dead enum while-let body")
19 | |     }
   | |_____^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
