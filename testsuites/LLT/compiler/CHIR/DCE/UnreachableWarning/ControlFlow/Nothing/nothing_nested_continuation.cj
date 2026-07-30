// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.

// Verify nested control flow in an artificial continuation has one source-root warning only.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func nestedArtificialContinuation(): Int64 {
    return 1
    if (true) {
        if (false) {
            println("unreachable nested branch")
        }
    }
    0
}

main() {
    println(nestedArtificialContinuation())
}

/* SCAN
warning: unreachable expression
  ==> nothing_nested_continuation.cj:10:5:
   | 
9  |       return 1
   |       ~~~~~~~~ any code following this expression is unreachable
10 |       if (true) {
   |  _____^
11 | |         if (false) {
   | | ...
14 | |     }
   | |_____^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
