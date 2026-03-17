// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-begin C.f2
// ASSERT: scan-next C1.f2

interface I<T> {
    static func f1(a: T): Unit

    static func f3(a: T): Unit {
        f1(a)
    }
}

open class C1 <: I<Int64> & I<String> {
    static public func f1(a: Int64): Unit {
        f1("1")
    }
    static public func f1(a: String): Unit {
        f2()
    }

    static public func f2(): Unit {
        println("C1.f2")
    }
}

open class C <: C1 {
    static public func f2(): Unit {
        println("C.f2")
    }
}

main(): Unit {
    C.f3(1)
    C1.f3(1)
}