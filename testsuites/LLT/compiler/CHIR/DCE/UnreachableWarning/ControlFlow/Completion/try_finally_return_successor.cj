// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a terminating finally makes only the first following expression unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func normalTryFinallyReturn(): Int64 {
    try {
        println("try body")
    } finally {
        return 1
    }
    println("unreachable after finally return")
    println("also unreachable after finally return")
    return 2
}

main() {
    normalTryFinallyReturn()
}

/* SCAN
warning: unreachable expression
  ==> try_finally_return_successor.cj:16:5:
   | 
11 |       try {
   |  _____~
12 | |         println("try body")
   | | ...
15 | |     }
   | |_____~ any code following this expression is unreachable
16 |       println("unreachable after finally return")
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
