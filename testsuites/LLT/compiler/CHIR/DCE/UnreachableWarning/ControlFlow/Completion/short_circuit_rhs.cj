// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Short-circuit operators make their skipped right operands unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func sideEffect(): Bool {
    println("side effect")
    true
}

main() {
    let reachable = sideEffect()
    let first = false && sideEffect()
    let second = true || sideEffect()
    let third = Option<Bool>.Some(true) ?? sideEffect()
    println(reachable)
    println(first)
    println(second)
    println(third)
}

/* SCAN-IN
warning: unreachable expression
  ==> short_circuit_rhs.cj:17:26:
   | 
17 |     let first = false && sideEffect()
   |                          ^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> short_circuit_rhs.cj:18:26:
   | 
18 |     let second = true || sideEffect()
   |                          ^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> short_circuit_rhs.cj:19:44:
   | 
19 |     let third = Option<Bool>.Some(true) ?? sideEffect()
   |                                            ^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
