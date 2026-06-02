// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE: %run %output 2>&1 | compare %f
// ASSERT: scan A::g(0)
// ASSERT: scan A::g(0)
// ASSERT: scan B::h(1)

open class A {
    static var x = 0
    static func g(n: Int64) {
        println("A::g(${n})")
    }

    protected open func f(): CFunc<() -> Unit> {
        var fn: CFunc<() -> Unit> = { =>
            x
            g
            g(x)
        }
        fn
    }
}

class B <: A {
    static var y = 1
    static func h(n: Int64) {
        println("B::h(${n})")
    }

    protected override func f(): CFunc<() -> Unit> {
        var fn: CFunc<() -> Unit> = { =>
            x
            g
            g(x)
            y
            h
            h(y)
        }
        fn
    }
}

unsafe main() {
    var a = A()
    var fn = a.f()
    fn()
    var b = B()
    fn = b.f()
    fn()
}
