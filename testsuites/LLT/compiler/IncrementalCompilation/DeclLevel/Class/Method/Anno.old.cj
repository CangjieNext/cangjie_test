@OverflowWrapping
main(): Unit {}
class A {

    func a(): Unit {}
    
    func b(): Unit {}
@OverflowSaturating
public static 
    func c(): Unit {}
}

open class B {

    func a(): Unit {}
    
    func b(): Unit {}
@OverflowSaturating
    protected open func 
    c(): Unit {}
}

class C <: B {
@OverflowThrowing
    protected open override func
    c(): Unit {}
}

interface D {
    @OverflowSaturating
    func foo(): Unit {}
}

extend B <: D {
    @OverflowThrowing
    public func foo(): Unit {}
}

enum F {
    Call|Nam(Int32)
     @OverflowThrowing
    func getm(): Unit {}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
