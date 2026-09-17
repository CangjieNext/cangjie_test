// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a const tuple selector makes a non-matching case unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    const pair = (1, 2)
    match (pair) {
        case (1, 2) => 0
        case (1, 3) => 1
        case _ => 2
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> constant_tuple_selector.cj:14:14:
   | 
14 |         case (1, 3) => 1
   |              ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> constant_tuple_selector.cj:15:14:
   | 
15 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
