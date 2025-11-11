/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.a

@C
public func callback(): Unit {}

public func callback1(): Unit {}

public open class A {
    public func test(): Unit {
        f(callback)
        f1(callback1)
    }

    public open func f(cb: CFunc<() -> Unit>): Unit {
        println("I am A f()")
    }

    public open func f1(cb: () -> Unit): Unit {
        println("I am A f1()")
    }
}

public class C <: A {
    public override func f(cb: CFunc<() -> Unit>): Unit {
        println("I am C f()")
    }

    public override func f1(cb: () -> Unit): Unit {
        println("I am C f1()")
    }
}
