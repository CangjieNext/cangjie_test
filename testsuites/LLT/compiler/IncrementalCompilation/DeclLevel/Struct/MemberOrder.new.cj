main(): Unit {}

class A {
    let b:Int64 =0
    let a:Int32 =0
}

open class B {
    public open func bar(): Int32{1}
    protected open func foo(): Int32 {0}
}

class D {
    protected static let b:Int64 =2
    static let a:Int32=1
}

struct E {
    private var b:Int32=1
    let a:Int32=1
}

struct F {
    public static let b:Int32=1
    static var a:Int32=1
}

abstract class G {
    public open func bar(): Int64 {0}
    protected func foo(): Int32 
}

abstract class H <: G {
    public func b(): Int64
    public func r(): Int32 
}

abstract class J {
    open protected prop b: Int32 {
        get() {1}
    }
    public mut prop a: Int32
}

open class K {
    public open func foo(): Int64 { 2 }
    public open prop b: Int32 {
        get() {1}
    }
}

abstract class L {
    public open prop b: Int32
    public open func foo(): Int64
}

class M {
    M(let b: Int32) {}
    var a: Int64 = 23
    var c: Int64 = 32
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
