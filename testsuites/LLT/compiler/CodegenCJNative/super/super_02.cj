// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class A {
    public var a_i: Int32 = 1
    public open func foo(): Int32 {
        return 1
    }
}

open class B <: A {
    public var b_i: Int32 = 3
    public override func foo(): Int32 {
        var num: Int32 = super.foo()
        return num
    }
}

open class Test <: B {
    public var test_i: Int32 = 2
    public var b: Int32 = 1
    public func f() {
        var num: Int32 = super.foo() + 2
        return num
    }
}

func run(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.f()
    if (res1 == 3) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
