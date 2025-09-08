public open class A {
    
    func a(): Unit {}

    func b(): Unit {}

    func c(): Unit {}
    public
    func d(): Unit {}
    private 
    func e(): Unit {}
    protected static 
    func f(): Unit {}

    func g(): Unit {}
    open protected
    func h(): Unit {}
    static 
    func i(): Unit {}

    init() {}

    init(v: Int32) {}

    prop pa: Int32 {
        get() { 1 }
    }
    
    prop pb: (Int32,Int64) {
        get() { (2,3) }
    }

    mut prop pc: Int32 {
        get() { 1 }
        set(v) {}
    }
    open public
    prop pd: Int64 {
        get() { 0 }
    }
}

abstract class B {
    public
    open func b(): Unit

    prop pa: Int32 {
        get() { -2 }
    }
    protected
    open prop pb: Int64 
}

class CC <: A {

    protected
    func h(): Unit {
        println(1)
    }
    static 
    func i(): Unit {}
    open public
    prop pd: Int64 {
        get() {1}
    }
}

struct SB {

    func a(): Unit {}
    static 
    prop pa: Int32 {
        get() { 1 }
    }
    static mut prop c: Int64 {
        get() {1}
        set(v) {}
    }
    
    init() {}
}

interface C {

    func a(): Unit {}
    static 
    prop pa: Int32 {
        get() { 1 }
    }
}

enum D {
    R|K 
    

    func ra(): Unit {}
    static 
    prop rb: Int32 {
        get() { 1 }
    }
    static 
    prop rc: Int64 {
        get() {1}
    }
}

extend D <: C {

    func f(): Unit {}
    static 
    prop pb: Int32 {
        get() {1}
    }
    
}

extend SB {
    mut
    func f(): Unit {}
}

main(): Unit {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
