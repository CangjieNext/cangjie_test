// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output | compare %f

func foo() {
    let b = 2
    func goo(): Unit {
        var x = goo
        println(b)
        if (b == 2) {
            return
        }
        x()
    }
    goo()
}

func foo1() {
    let b = 3
    func goo1() {
        println(b)
    }
    var x = goo1
    x()
    var y = goo1
    return x
}

main() {
    foo()
    foo1()()
}

/* SCAN
2
3
3
*/
