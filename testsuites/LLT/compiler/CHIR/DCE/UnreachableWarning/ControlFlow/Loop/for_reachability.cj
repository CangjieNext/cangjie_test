// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Empty ranges warn, while false where filters do not make for bodies unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    for (_ in 0..0) { println("unreachable empty range") }
    for (_ in 2..2) { println("unreachable equal range") }
    for (_ in 2..0) { println("unreachable descending range") }
    for (_ in 0..10 : -1) { println("unreachable negative step range") }

    for (_ in 0..3 where false) {
        println("range for where body")
    }

    let values = [1, 2, 3]
    for (_ in values where false) {
        println("iterator for where body")
    }

    tryFinallyForInConditionalReturn(true)
}

func tryFinallyForInConditionalReturn(shouldReturn: Bool): Unit {
    try {
        for (_ in 0..10) {
            if (shouldReturn) {
                return
            }
        }
    } finally {
    }
}

/* SCAN
warning: unreachable block in 'for' expression
  ==> for_reachability.cj:11:21:
   | 
11 |     for (_ in 0..0) { println("unreachable empty range") }
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'for' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'for' expression
  ==> for_reachability.cj:12:21:
   | 
12 |     for (_ in 2..2) { println("unreachable equal range") }
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'for' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'for' expression
  ==> for_reachability.cj:13:21:
   | 
13 |     for (_ in 2..0) { println("unreachable descending range") }
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'for' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'for' expression
  ==> for_reachability.cj:14:27:
   | 
14 |     for (_ in 0..10 : -1) { println("unreachable negative step range") }
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable block in 'for' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
