// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f

// The captured variable must be defined before the closure.
let x = 4

func f() {
    print("${x}") // Print 4.
    let x = 99
    func f1() {
        print("${x}")
    }
    let f2 = {
        => print("${x}")
    }
    f1() // Print 99.
    f2() // Print 99.
}

main() {
    f()
}

// ASSERT: scan 49999
