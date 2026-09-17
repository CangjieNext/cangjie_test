// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Known constructors and their bindings select if-let conditions.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum State {
    | Ready
    | Stopped
}

func knownEnum() {
    let state = State.Ready
    if (let Ready <- state) {
        println("ready")
    } else {
        println("dead enum else")
    }
}

func knownSome() {
    let value = Option<Int64>.Some(1)
    if (let Some(number) <- value) {
        println(number)
    } else {
        println("dead Some else")
    }
}

func knownNone() {
    let value = Option<Int64>.None
    if (let Some(number) <- value) {
        println(number)
    }
}

// Constructor tags are tracked, but payload bindings remain unknown.
func contradictoryBinding() {
    let value = Option<Int64>.Some(1)
    if (let Some(number) <- value && number < 0) {
        println("dead if-let conjunction")
    }
}

main() {
    knownEnum()
    knownSome()
    knownNone()
    contradictoryBinding()
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> if_let_conditions.cj:19:12:
   | 
19 |       } else {
   |  ____________^
20 | |         println("dead enum else")
21 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> if_let_conditions.cj:28:12:
   | 
28 |       } else {
   |  ____________^
29 | |         println("dead Some else")
30 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> if_let_conditions.cj:35:13:
   | 
35 |     if (let Some(number) <- value) {
   |             ^^^^^^^^^^^^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
