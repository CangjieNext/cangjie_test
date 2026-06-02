// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 

main() {
    if (true) {
    } else if (true) {
        var b = 2
    } else {
        var c = 3
    }
    0
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> testDCEIf16.cj:12:12:
   | 
12 |       } else if (true) {
   |  ____________^
13 | |         var b = 2
   | | ...
16 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> testDCEIf16.cj:12:22:
   | 
12 |       } else if (true) {
   |  ______________________^
13 | |         var b = 2
14 | |     } else {
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> testDCEIf16.cj:14:12:
   | 
14 |       } else {
   |  ____________^
15 | |         var c = 3
16 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
