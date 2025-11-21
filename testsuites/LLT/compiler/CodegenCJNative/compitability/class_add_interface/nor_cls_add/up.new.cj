// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package up

interface I1 {
    func foo(): Int64 { -11 }
}

interface I2 {
    func goo(): Int64 { -2 }
}

interface I3 <: I1 {
    func foo(): Int64 { -3 }
    func goo(): Int64 { -3 }
}

interface I4 <: I1 & I2 {
    func foo(): Int64 { -4 }
    func goo(): Int64 { -4 }
}

interface I5 {}

interface I6 {
    func joo(): Int64
}

interface Ip0 {
    prop p0: Int64
}

interface Ip1 {
    mut prop p1: Int64
}

interface Ifp0 {
    func joo(): Int64
    prop p0: Int64
    mut prop p1: Int64
}

interface Ig<T> {
    func joo(): T
    mut prop p1: T
}

interface Ifg {
    func joo<T>(i : T): Int64
}

// 无父接口，增加后出现override
public class C00 <: I1 {
    public func foo(): Int64 { 0 }
}

// 无父接口，增加不override
public class C01 <: I2 {
    public func foo(): Int64 { goo() }
}

// 已有父接口，增加接口实现后出现override
public class C1 <: I1 & I2 {
    public func foo(): Int64 { goo() }
    public func goo(): Int64 { 2 }
    public func hoo(): Int64 { 1 }
}

// 已有父接口，增加接口实现后无override
public class C2 <: I1 & I2 {
    public func hoo(): Int64 { 2 }
}

// 已有父接口，增加接口，增加其父接口
public class C3 <: I3 & I2 {
    public func foo(): Int64 { 3 }
    public func goo(): Int64 { foo() }
    public func hoo(): Int64 { 2 }
}

// 已有父接口，增加两个接口，一个override一个调用
public class C4 <: I6 & I1 & I2{
    public func foo(): Int64 { goo() }

    public func hoo(): Int64 { 4 }

    public func joo(): Int64 { 4 }
}

// 空class增加接口继承实现
public class C5 <: I1 {
}

// 空class增加接口override实现
public class C6 <: I1 {
    public func foo(): Int64 { 6 }
}

// 空class增加接口并实现
public class C7 <: I1 {
    public func foo(): Int64 { 7 }
}

// class增加接口并提供实现
public class C8 <: I1 & I6 {
    public func foo(): Int64 { 8 + joo() }
    public func joo(): Int64 { 1 }
}

// class增加接口中仅含有非mut属性并提供实现
public class C9 <: I1 & Ip0 {
    public func foo(): Int64 { 9 + p0 }
    public prop p0 : Int64 {
        get() { 1 }
    }
}

// class增加接口中仅含有非mut属性并override实现
public class C10 <: I1 & Ip0 {
    public func foo(): Int64 { 10 + p0 }
    public prop p0 : Int64 {
        get() { 1 }
    }
}

// class增加接口中仅含有mut属性并提供实现
public class C11 <: I1 & Ip1 {
    var a : Int64 = 0
    public func foo(): Int64 {
        p1 = 12
        p1
    }
    public mut prop p1 : Int64 {
        get() { a }
        set(v) { a = v }
    }
}

// class增加接口中仅含有mut属性并已有实现
public class C12 <: I1 & Ip1 {
    var a : Int64 = 0
    public func foo(): Int64 {
        p1 = 12 + 1
        p1
    }
    public mut prop p1 : Int64 {
        get() { a }
        set(v) { a = v }
    }
}

// class增加接口中含有函数和属性的接口
public class C13 <: I1 & Ifp0 {
    var a : Int64 = 0
    public func foo(): Int64 {
        p1 = 12
        p1 + p0 + joo()
    }
    public mut prop p1 : Int64 {
        get() { a }
        set(v) { a = v }
    }
    public prop p0 : Int64 {
        get() { 1 }
    }
    public func joo(): Int64 { 1 }
}

// class增加含有泛型参数的接口，并提供实现
public class C14 <: I1 & Ig<Int64> {
    var a : Int64 = 0
    public func foo(): Int64 {
        p1 = 14
        p1 + joo()
    }
    public mut prop p1 : Int64 {
        get() { a }
        set(v) { a = v }
    }
    public func joo(): Int64 { 1 }
}

// class增加含有泛型参数的接口，并已有实现
public class C15 <: I1 & Ig<Int64> {
    var a : Int64 = 0
    public func foo(): Int64 {
        p1 = 15
        p1 + joo()
    }
    public mut prop p1 : Int64 {
        get() { a }
        set(v) { a = v }
    }
    public func joo(): Int64 { 1 }
}

// class增加含有泛型函数的接口，并提供实现
public class C16 <: I1 & Ifg {
    var a : Int64 = 0
    public func foo(): Int64 {
        16 + joo<Int64>(0)
    }
    public func joo<T>(i: T): Int64 { 1 }
}

// class增加含有泛型函数的接口，并已有实现
public class C17 <: I1 & Ifg {
    var a : Int64 = 0
    public func foo(): Int64 {
        17 + joo<Int64>(0)
    }

    public func joo<T>(i: T): Int64 { 1 }
}

public func test(): Int64 {
    C5().foo() + C6().foo() + C7().foo()
}