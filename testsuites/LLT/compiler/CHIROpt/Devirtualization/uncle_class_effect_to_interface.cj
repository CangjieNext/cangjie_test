// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to f1 at [33,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to f1 at [35,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T> {
    func f1(a: T): Int64 {
        1
    }
    func f2(a: T): Int64 {
        f1(a)
    }
}

open class A {
    public open func f1(a: Int64): Int64 {
        0
    }
}

class B <: A & I<Int64> {}

main() {
    var a: I<Int64> = B()
    a.f1(1) // should print extend A f1
    var b: A = B()
    b.f1(1) // print extend A f1
}
