// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A known nested Some value makes the failed if-let else branch unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let value = Option<Option<Int64>>.Some(Option<Int64>.Some(1))
    if (let Some(Some(number)) <- value) {
        println(number)
    } else {
        println("dead nested Some else")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> nested_if_let_known_some.cj:14:12:
   | 
14 |       } else {
   |  ____________^
15 | |         println("dead nested Some else")
16 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
