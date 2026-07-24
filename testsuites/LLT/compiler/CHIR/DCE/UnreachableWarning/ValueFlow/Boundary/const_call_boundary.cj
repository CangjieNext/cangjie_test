// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A normal call invalidates tracked vars but preserves compile-time constants.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func observe() {}

main() {
    const value = 1
    observe()
    if (value < 0) {
        println("unreachable const condition after call")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> const_call_boundary.cj:15:20:
   | 
15 |       if (value < 0) {
   |  ____________________^
16 | |         println("unreachable const condition after call")
17 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
