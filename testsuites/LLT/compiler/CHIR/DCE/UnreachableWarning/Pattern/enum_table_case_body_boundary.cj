// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify enum table traversal does not enter a nested match in an unreachable pattern body.
// EXEC-PIPE-0: %compiler %cmp_opt -O2 %f -o %output 2>&1 | compare %f

enum State {
    | Active(Int64)
    | Stopped
}

main() {
    const state = State.Stopped
    match (state) {
        case Active(1) =>
            match (true) {
                case true => 0
                case false => 1
            }
        case _ => 2
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> enum_table_case_body_boundary.cj:18:14:
   | 
18 |         case Active(1) =>
   |              ^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
