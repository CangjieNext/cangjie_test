// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan B
// ASSERT: scan-not A
// ASSERT: scan 300

open class A {
    public open func foo(): Unit {
        println("A")
    }
}

open class B <: A {
    public open func foo(): Unit {
        println("B")
    }
}

main() {
    var a: A = B()
    try {
        a.foo()
    } catch (e: Exception) {
        println(200)
    } finally {
        println(300)
    }
    return 0
}
