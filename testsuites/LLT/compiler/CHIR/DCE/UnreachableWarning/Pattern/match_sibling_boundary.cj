// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify an or-pattern reaches later sibling cases without entering an unreachable case body.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let selector = 1
    match (selector) {
        case 1 | 2 => 0
        case value where value > 0 =>
            match (true) {
                case true => 0
                case false => 1
            }
        case 3 => 0
        case _ => 0
    }
}

/* SCAN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:14:14:
   | 
14 |         case value where value > 0 =>
   |              ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> match_sibling_boundary.cj:19:14:
   | 
19 |         case 3 => 0
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> match_sibling_boundary.cj:20:14:
   | 
20 |         case _ => 0
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
