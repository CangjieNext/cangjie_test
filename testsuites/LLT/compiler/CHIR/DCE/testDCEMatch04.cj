// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

main() {
    match (0) {
        case 0 => 0
        case 0 | 0 | 0 => 1
        case _ => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> testDCEMatch04.cj:13:14:
   | 
13 |         case 0 | 0 | 0 => 1
   |              ^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> testDCEMatch04.cj:14:14:
   | 
14 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
