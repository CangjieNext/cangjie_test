// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify an unreachable short-circuit guard still leads to later source cases.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt -O2 %f -o %output

main() {
    const selector = 1
    match (selector) {
        case 1 => 0
        case value where (value > 0 && value < 10) || value == 20 => 1
        case 2 => 2
        case 3 => 3
        case _ => 4
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> match_short_circuit_guard_siblings.cj:15:14:
   | 
15 |         case value where (value > 0 && value < 10) || value == 20 => 1
   |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_short_circuit_guard_siblings.cj:16:14:
   | 
16 |         case 2 => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_short_circuit_guard_siblings.cj:17:14:
   | 
17 |         case 3 => 3
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> match_short_circuit_guard_siblings.cj:18:14:
   | 
18 |         case _ => 4
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
