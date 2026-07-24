// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a const Unit selector keeps its matching case reachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    const value: Unit = ()
    match (value) {
        case () => println("Unit case")
        case _ => println("unreachable Unit fallback")
    }
}

/* SCAN
warning: unreachable pattern
  ==> const_unit_match_selector.cj:14:14:
   | 
14 |         case _ => println("unreachable Unit fallback")
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
