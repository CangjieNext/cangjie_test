// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib --debug-macro %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan foo0 success
// ASSERT: scan foo1 success
// ASSERT: scan foo2 success
// ASSERT: scan A0 success
// ASSERT: scan A1 success
// ASSERT: scan A2 success

import define.*

@Receiver
public func foo0(): Unit { println("foo0 success") }


@Receiver
public func foo1(): Unit { println("foo1 success")}


@Receiver
public func foo2(): Unit { println("foo2 success")
}

@Receiver
class A0 {
    public func foo(): Unit { println("A0 success")
    }}

@Receiver
class A1 {
    public func foo(): Unit { println("A1 success")
    } }

@Receiver
class A2 {
    public func foo(): Unit { println("A2 success")
    }
}

main() {
    foo0()
    foo1()
    foo2()
    let x0 = A0()
    x0.foo()
    let x1 = A1()
    x1.foo()
    let x2 = A2()
    x2.foo()
    0
}