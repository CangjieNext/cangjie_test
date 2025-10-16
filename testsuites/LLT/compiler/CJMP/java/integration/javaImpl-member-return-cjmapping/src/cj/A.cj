// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

@JavaImpl
public class A <: M {
    public init() { }
    override public func goo(): Unit {
        println("Hello from overridden A goo()")
        super.goo()
    }

    public func getVector(x: Int32, y: Int32): Vector {
        print("cj: getVector from @JavaImpl class A (${x}, ${y})\n", flush: true)
        return Vector(x, y)
    }

    public func echoVector(v: Vector): Vector {
        print("cj: echoVector from @JavaImpl class A\n", flush: true)
        return v
    }
}
