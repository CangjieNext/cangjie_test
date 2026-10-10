// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify known non-matching Option and enum constructors skip while-let bodies.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum State {
    | Ready
    | Stopped
}

func enumDoesNotMatch() {
    let state = State.Stopped
    while (let Ready <- state) {
        println("dead enum while-let body")
    }
}

func noneDoesNotMatch() {
    let value = Option<Int64>.None
    while (let Some(number) <- value) {
        println(number)
    }
}

main() {
    enumDoesNotMatch()
    noneDoesNotMatch()
}

/* SCAN-IN
warning: unreachable block in 'while' expression
  ==> while_let_known_constructor.cj:17:32:
   | 
17 |       while (let Ready <- state) {
   |  ________________________________^
18 | |         println("dead enum while-let body")
19 | |     }
   | |_____^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'while' expression
  ==> while_let_known_constructor.cj:24:16:
   | 
24 |     while (let Some(number) <- value) {
   |                ^^^^^^^^^^^^ unreachable block in 'while' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
