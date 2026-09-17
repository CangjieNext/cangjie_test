// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false guard must not hide later reachable and unreachable match cases,
// and a reachable guard fact must reach its case body.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt -O2 %f -o %output

main() {
    let grade = 85
    let label = match (grade) {
        case g where g >= 90 => "A"
        case g where g >= 80 => "B"
        case g where g >= 70 => "C"
        case _ => "D"
    }
    println(label)

    let value = 1
    match (value) {
        case number where number > 0 =>
            if (number < 0) {
                println("unreachable case guard body")
            }
        case _ => println("fallback")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> match_where_constant_chain.cj:16:22:
   | 
16 |         case g where g >= 90 => "A"
   |                      ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_where_constant_chain.cj:18:14:
   | 
18 |         case g where g >= 70 => "C"
   |              ^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_where_constant_chain.cj:19:14:
   | 
19 |         case _ => "D"
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> match_where_constant_chain.cj:26:29:
   | 
26 |               if (number < 0) {
   |  _____________________________^
27 | |                 println("unreachable case guard body")
28 | |             }
   | |_____________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_where_constant_chain.cj:29:14:
   | 
29 |         case _ => println("fallback")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
