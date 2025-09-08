main(): Unit {}

open class A {
    public static 
    func foo(): Int64
    { 0 }
    public open 
    func bar(): Int64
    { 1 }
    static 
    init() {}
    
    init() {}
protected 
    init(a: Int64) {

    }

static mut 
    prop v: Int32
    {
        get() {
            3
        }
        set(v) {
            println(v)
        }
    }
}

class B {
    ~init() {}

    B(public let 
    a 
    : Int64,
    private var b:
    Int32) 
    {}
}

enum C {
    R|K(Int32)

    static prop 
    g: ?Int32 {
        get() { Some(3) }
    }
    static private
    func t(): (Array<Int32>) 
    {
        [1,2,3]
    }
}

interface IA {
    static 
    func foo(): Unit {}
    func bar(): Unit

    func goo(): Unit
    { foo() }
}

open class D<A> {
    public static 
    func foo(): Int64
    { 0 }
    public open 
    func bar(): Int64
    { 1 }
    static 
    init() {}
    
    init() {}
protected 
    init(a: Int64) {

    }

static mut 
    prop v: Int32
    {
        get() {
            3
        }
        set(v) {
            println(v)
        }
    }
}

class E<T> {
    ~init() {}

    E(public let 
    a 
    : Int64,
    private var b:
    Int32) 
    {}
}

enum F<T> {
    R|K(T)

    static prop 
    g: ?Int32 {
        get() { Some(3) }
    }
    static private
    func t(): (Array<Int32>) 
    {
        [1,2,3]
    }
}

interface G<T> {
    static 
    func foo(): Unit {}
    func bar(): Unit

    func goo(): Unit
    { foo() }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
