// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I1 {
    func f1(a: Int64): Unit {
        println("I")
    }
}

open class A {
    public open func f1(a: Int64): Unit {
        println("extend A f1")
    }
}

open class A1 <: A & I1 {}

open class A2 <: A1 & I1 {
    public open override func f1(a: Int64): Unit {
        println("extend A2 f1")
    }
}

func Test(i1: I1) {
    i1.f1(1)
}

func Test1(a: A) {
    a.f1(1)
}

main() {
    Test(A2())
    Test1(A2())
}
