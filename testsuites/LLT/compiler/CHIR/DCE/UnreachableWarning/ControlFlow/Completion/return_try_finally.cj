// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the successor of an all-return try-finally is unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func returnWithFinally(): Int64 {
    try { return 1 } finally { println("cleanup") }
    println("unreachable after try-finally")
    return 2
}

main() {
    returnWithFinally()
}

/* SCAN
warning: unreachable expression
  ==> return_try_finally.cj:12:5:
   | 
11 |     try { return 1 } finally { println("cleanup") }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
12 |     println("unreachable after try-finally")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
