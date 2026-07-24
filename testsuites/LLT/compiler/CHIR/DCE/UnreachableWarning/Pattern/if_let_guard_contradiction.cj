// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A known if-let binding participates in the following && condition.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let value = Option<Int64>.Some(1)
    if (let Some(number) <- value && number < 0) {
        println("dead if-let conjunction")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> if_let_guard_contradiction.cj:12:50:
   | 
12 |       if (let Some(number) <- value && number < 0) {
   |  __________________________________________________^
13 | |         println("dead if-let conjunction")
14 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
