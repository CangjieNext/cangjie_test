// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A tuple index of a const tuple contributes a compile-time condition.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    const pair = (1, 2)
    const first = pair[0]
    if (first < 0) {
        println("unreachable const tuple index condition")
    }
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> const_tuple_index_condition.cj:13:20:
   | 
13 |       if (first < 0) {
   |  ____________________^
14 | |         println("unreachable const tuple index condition")
15 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
