// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A known enum constructor makes the failed if-let else branch unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum State {
    | Ready
    | Stopped
}

main() {
    let state = State.Ready
    if (let Ready <- state) {
        println("ready")
    } else {
        println("dead enum else")
    }
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> if_let_known_enum.cj:19:12:
   | 
19 |       } else {
   |  ____________^
20 | |         println("dead enum else")
21 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
