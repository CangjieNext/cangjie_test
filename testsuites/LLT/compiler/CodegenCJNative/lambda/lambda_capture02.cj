// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {
    public var a0: Int64 = 1
    public var a1: Int64 = 2
    public var a: Int64 = 3
    public func test(): B {
        var b = B(foo)
        return b
    }

    public func test2(): B {
        var b = B({=> foo()})
        return b
    }

    public func paddFunc() {}

    public func foo(): Int64 {
        return a
    }
}

class B {
    public var function: () -> Int64
    public init(f: () -> Int64) {
        this.function = f
    }
    public func test(): Int64 {
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
