// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// ASSERT: scan 111111

interface I1<T> where T <: ToString {
    func foo(a: T): Unit {
        println(a)
    }
}

interface I2 {
    func foo(a: Int64): Unit {
        println(222222)
    }
}

interface I3 {
    func foo(a: Int64): Unit {
        println(333333)
    }
}

interface I4 {
    func foo(a: Int64): Unit {
        println(444444)
    }
}

open class B <: I1<Int64> & I2 & I3 & I4 {
    public func foo(a: Int64) {
        println(111111)
    }
}

main() {
    B().foo(123456789)
}