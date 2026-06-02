// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-PIPE-0: %run %run_opt %output | compare %f

func foo() {
    var x = 1
    func goo() {
        println(x)
        x = 3
        return x
    }
    let y = x
    x = 2
    goo()
    let z = x
    println("y = ${y}, z = ${z}")
}

main() {
    foo()
}

/* SCAN
2
y = 1, z = 3
*/
