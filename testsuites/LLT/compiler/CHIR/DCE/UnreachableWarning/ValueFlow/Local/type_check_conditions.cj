// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify provably true and false type-test conditions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


open class Base {}
class Derived <: Base {}
class OtherDerived <: Base {}

main() {
    let derived = Derived()
    if (derived is Base) {
        println("reachable supertype check")
    } else {
        println("unreachable supertype else")
    }

    if (derived is OtherDerived) {
        println("unreachable sibling type check")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> type_check_conditions.cj:19:12:
   | 
19 |       } else {
   |  ____________^
20 | |         println("unreachable supertype else")
21 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> type_check_conditions.cj:23:34:
   | 
23 |       if (derived is OtherDerived) {
   |  __________________________________^
24 | |         println("unreachable sibling type check")
25 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
