open class A {
    public open func foo(): Unit {
        println("A foo")
    }
}

func lm(a: A) {
    a.foo()
}

main() {
    lm(B())
}

open class B <: A {
    public override open func foo(): Unit {
        println("B foo")
    }
}

// ASSERT: scan B foo
// ASSERT: scan-not A foo

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
