// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify an outer pattern entry does not absorb an optimized nested match body.
// EXEC-PIPE-0: %compiler %cmp_opt -O2 %f -o %output 2>&1 | compare %f

enum State {
    | Active(Int64)
    | Stopped
}

main() {
    const selector = 1
    match (selector) {
        case 1 where true => 0
        case value =>
            const state = State.Stopped
            match (state) {
                case Active(1) => 1
                case Active(2) => 2
                case _ => 3
            }
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> match_case_body_table_boundary.cj:19:14:
   | 
19 |         case value =>
   |              ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
