main(): Unit {}

class A {
    let a:Int32 =0
    let b:Int64 =0
}

open class B {
    protected open func foo(): Int32 {0}
    public open func bar(): Int32{1}
}

class D {
    static let a:Int32=1
    protected static let b:Int64 =2
}

struct E {
    let a:Int32=1
    private var b:Int32=1
}

struct F {
    static var a:Int32=1
    public static let b:Int32=1
}

abstract class G {
    protected func foo(): Int32 
    public open func bar(): Int64 {0}
}

abstract class H <: G {
    public func r(): Int32 
    public func b(): Int64
}

abstract class J {
    public mut prop a: Int32 
    open protected prop b: Int32 {
        get() {1}
    }
}

open class K {
    public open prop b: Int32 {
        get() {1}
    }
    public open func foo(): Int64 { 2 }
}

abstract class L {
    public open func foo(): Int64
    public open prop b: Int32
}

class M {
    var a: Int64 = 23
    M(let b: Int32) {}
    var c: Int64 = 32
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
