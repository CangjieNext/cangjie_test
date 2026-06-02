// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {
    var a0: Int64 = 1
    var a1: Int64 = 2
    var a: Int64 = 3
    func test(): B {
        var b = B(foo)
        return b
    }

    func test2(): B {
        var b = B({=> foo()})
        return b
    }

    func paddFunc() {}

    func foo(): Int64 {
        return a
    }
}

class B {
    var function: () -> Int64
    init(f: () -> Int64) {
        this.function = f
    }
    func test(): Int64 {
        return function()
    }
}

main(): Int64 {
    var a = A()
    var b0 = a.test()
    var b1 = a.test2()
    if (b0.test() != 3 || b1.test() != 3) {
        return 1
    }
    return 0
}
