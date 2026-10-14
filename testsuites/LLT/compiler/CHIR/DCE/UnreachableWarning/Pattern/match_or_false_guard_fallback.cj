// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A false guard after an or-pattern rejects its case, so the fallback remains reachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let x = 2
    match (x) {
        case 1 | 2 where false => println("g")
        case _ => println("b")
    }
}

/* SCAN
warning: unreachable pattern
  ==> match_or_false_guard_fallback.cj:13:26:
   | 
13 |         case 1 | 2 where false => println("g")
   |                          ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
