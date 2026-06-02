public open class A {
    public 
    func a(): Unit {}
protected open 
    func b(): Unit {}
open public
    func c(): Unit {}
    public open 
    func d(): Unit {}
    static 
    func e(): Unit {}
    protected static 
    func f(): Unit {}
static 
    func g(): Unit {}
     public open
    func h(): Unit {}
    static private
    func i(): Unit {}
 
    init() {}

    init(v: Int32) {}
open protected
    prop pa: Int32 {
        get() { 1 }
    }
    static 
    prop pb: (Int32,Int64) {
        get() { (2,3) }
    }
protected
    mut prop pc: Int32 {
        get() { 1 }
        set(v) {}
    }
    protected open 
    prop pd: Int64 {
        get() { 0 }
    }
}

abstract class B {
    public 
  static func b(): Unit {}
static 
    prop pa: Int32 {
        get() { -2 }
    }
    protected
         prop pb: Int64 
}

class CC <: A {

    public override
    func h(): Unit {
        println(1)
    }
     
    func i(): Unit {}
    open protected
    prop pd: Int64 {
        get() {1}
    }
}

struct SB {
public mut 
    func a(): Unit {}
      
    prop pa: Int32 {
        get() { 1 }
    }
           mut prop c: Int64 {
        get() {1}
        set(v) {}
    }
    static
    init() {}
}

interface C {
    mut
    func a(): Unit {}
    static   
    prop pa: Int32 {
        get() { 1 }
    }
}

enum D {
    R|K 
    
public 
    func ra(): Unit {}
    static private
    prop rb: Int32 {
        get() { 1 }
    }
    static public
    prop rc: Int64 {
        get() {1}
    }
}

extend D <: C {
public
    func f(): Unit {}
    static public
    prop pb: Int32 {
        get() {1}
    }
    
}

extend SB {
    
    func f(): Unit {}
}


main(): Unit {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
