/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import interoplib.objc.*

public class B {
}

public open class Base {
    protected open func hello() {
        println("Base hello()")
    }
}

public open class A <: Base {
    // init
    public init() {
        println("A init()")
    }
    public init(a: Int64) {
        println("A init(Int64)")
    }

    // instance method
    protected open override func hello() {
        println("A hello()")
    }

    public func sayHello() {
        println("A sayHello()")
        hello()
    }

    public open func foo(x: Int64): Int64 {
        println("A foo(Int64): get ${x}")
        x
    }


    public func foo(x: Int64, y: Int64): Int64 {
        println("A foo(Int64, Int64): get ${x}, ${y}")
        foo(x) + y
    }

    public static func sfoo(x: Int64): Int64 {
        println("A sfoo(Int64): get ${x}")
        x
    }

    public static func sfoo(x: Int64, y: Int64): Int64 {
        println("A sfoo(Int64, Int64): get ${x}, ${y}")
        sfoo(x) + y
    }

    // Not supported members: member with open class type
    // method with class parameter
    public func fooParamA(x: A): Int64 {
        println("A fooParamA(A)")
        1
    }
    // method with class return
    public func fooRetA(x: Int64): A {
        println("A fooRetA(Int64)")
        A()
    }

    public func fooParamB(x: B): Int64 {
        println("A fooParamB(B)")
        1
    }

    public func fooRetB(x: Int64): B {
        println("A fooRetA(Int64)")
        B()
    }

    // member var
    public var a: Int64 = 0
    // member prop
    public prop pb: Int64 {
        get() {
            1
        }
    }

    public func fooParamString(x: String) {
        println("A fooParamString(String)")
    }

    public func fooRetString(x: Int64): String {
        println("A fooRetString(Int64)")
        "hello"
    }

    protected func protectedFunc() {
        println("A protectedFunc()")
    }
}
