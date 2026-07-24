// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false first match guard must report an unreachable pattern at the guard.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let grade = 85
    let label = match (grade) {
        case g where g >= 90 => "A"
        case _ => "other"
    }
    println(label)
}

/* SCAN
warning: unreachable pattern
  ==> match_where_first_guard.cj:14:22:
   | 
14 |         case g where g >= 90 => "A"
   |                      ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
