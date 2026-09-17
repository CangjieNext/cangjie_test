// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An unreachable sibling case is diagnosed once; its nested match body is not revisited.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let selector = 1
    match (selector) {
        case 1 => 0
        case 2 =>
            match (true) {
                case true => 0
                case false => 1
            }
        case _ => 0
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> unreachable_case_body_no_recursion.cj:14:14:
   | 
14 |         case 2 =>
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> unreachable_case_body_no_recursion.cj:19:14:
   | 
19 |         case _ => 0
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
