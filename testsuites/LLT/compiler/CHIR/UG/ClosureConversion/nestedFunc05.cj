// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f

main() {
    func foo<T>(a: T): Unit {
        println("foo")
    }
    func goo(a: Int32): Unit {
        println("goo")
    }
    var x = goo
    x(1)
    x = foo<Int32>
    x(2)
}

/* SCAN
goo
foo
*/
