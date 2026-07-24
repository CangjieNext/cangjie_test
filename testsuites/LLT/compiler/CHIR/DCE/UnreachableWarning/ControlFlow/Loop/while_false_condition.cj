// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A while(false) body is unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    while (false) {
        println("dead while body")
    }
}

/* SCAN
warning: unreachable block in 'while' expression
  ==> while_false_condition.cj:11:19:
   | 
11 |       while (false) {
   |  ___________________^
12 | |         println("dead while body")
13 | |     }
   | |_____^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
