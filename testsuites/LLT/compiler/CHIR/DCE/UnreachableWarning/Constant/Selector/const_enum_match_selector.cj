// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a const enum selector makes a non-matching case unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum State {
    | Ready
    | Stopped
}

main() {
    const state = State.Ready
    match (state) {
        case Stopped => println("unreachable stopped case")
        case _ => println("fallback")
    }
}

/* SCAN
warning: unreachable pattern
  ==> const_enum_match_selector.cj:18:14:
   | 
18 |         case Stopped => println("unreachable stopped case")
   |              ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
