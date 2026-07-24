// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A known None value makes a while-let body unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let value = Option<Int64>.None
    while (let Some(number) <- value) {
        println(number)
    }
}

/* SCAN
warning: unreachable block in 'while' expression
  ==> while_let_known_none.cj:12:39:
   | 
12 |       while (let Some(number) <- value) {
   |  _______________________________________^
13 | |         println(number)
14 | |     }
   | |_____^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
