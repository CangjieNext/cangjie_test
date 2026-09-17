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
        case 1 | 2 => ()
        case value where value > 0 =>
            match (true) {
                case true => ()
                case false => ()
            }
        case 3 => ()
        case _ => ()
    }

    let missing = 4
    match (missing) {
        case 2 | 3 where true => ()
        case _ => ()
    }

    let sibling = 1
    match (sibling) {
        case 1 => ()
        case 2 | 3 where true => ()
        case _ => ()
    }

    let tupleSelector = (5, 6)
    match (tupleSelector) {
        case (1, 2) | (3, 4) where true => ()
        case _ => ()
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:14:14:
   | 
14 |         case value where value > 0 =>
   |              ^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:19:14:
   | 
19 |         case 3 => ()
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:20:14:
   | 
20 |         case _ => ()
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:25:14:
   | 
25 |         case 2 | 3 where true => ()
   |              ^^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:32:14:
   | 
32 |         case 2 | 3 where true => ()
   |              ^^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:33:14:
   | 
33 |         case _ => ()
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:38:14:
   | 
38 |         case (1, 2) | (3, 4) where true => ()
   |              ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_sibling_boundary.cj:38:23:
   | 
38 |         case (1, 2) | (3, 4) where true => ()
   |                       ^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
