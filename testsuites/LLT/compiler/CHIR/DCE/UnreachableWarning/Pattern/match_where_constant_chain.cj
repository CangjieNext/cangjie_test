// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false guard must not hide later reachable and unreachable match cases.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let grade = 85
    let label = match (grade) {
        case g where g >= 90 => "A"
        case g where g >= 80 => "B"
        case g where g >= 70 => "C"
        case _ => "D"
    }
    println(label)
}

/* SCAN
warning: unreachable pattern
  ==> match_where_constant_chain.cj:14:22:
   | 
14 |         case g where g >= 90 => "A"
   |                      ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> match_where_constant_chain.cj:16:14:
   | 
16 |         case g where g >= 70 => "C"
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> match_where_constant_chain.cj:17:14:
   | 
17 |         case _ => "D"
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
