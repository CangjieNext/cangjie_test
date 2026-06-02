// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let cs = match (1) {
        case 1 => "Green"
        case _ =>
            if (true) {
                "Black"
            } else {
                "Blue"
            }
    }
    return 0
}

/* SCAN
warning: unused variable:'cs'
  ==> testUnusedCode14.cj:10:9:
   | 
10 |     let cs = match (1) {
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> testUnusedCode14.cj:12:14:
   | 
12 |         case _ =>
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> testUnusedCode14.cj:13:23:
   | 
13 |               if (true) {
   |  _______________________^
14 | |                 "Black"
15 | |             } else {
   | |_____________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> testUnusedCode14.cj:15:20:
   | 
15 |               } else {
   |  ____________________^
16 | |                 "Blue"
17 | |             }
   | |_____________^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
