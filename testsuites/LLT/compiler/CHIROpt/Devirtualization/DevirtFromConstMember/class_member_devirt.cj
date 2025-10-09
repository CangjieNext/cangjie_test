// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to foo at [29,9] was optimized.
// ASSERT: scan [Devirtualization] The function call to foo at [46,9] was optimized.
// ASSERT: scan [Devirtualization] The function call to foo at [65,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to foo at [59,9] was optimized.

open class CA {
    public open func foo(): Unit {}
}

class CB <: CA {
    public func foo(): Unit {}
}

class CC <: CA {
    public func foo(): Unit {}
}

class Test {
    let b: CA = CB()
    func goo() {
        b.foo()
    }
}

class Test2 {
    public let b: CA
    init() {
        b = CB()
    }
    init(i: Int64) {
        if (i > 3) {
            b = CB()
        } else {
            b = CB()
        }
    }
    func hoo() {
        b.foo()
    }
}

open class TestI {
    let b: CA
    init() {
        b = CC()
    }
}

class TestII <: TestI {
    func hoo() {
        b.foo()
    }
}

main() {
    let xx: Test2 = Test2()
    xx.b.foo()
}
