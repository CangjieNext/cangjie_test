@OverflowWrapping
main(): Unit {}
class A {
@OverflowThrowing
    func a(): Unit {}
    @OverflowSaturating
    func b(): Unit {}
        
public static 
    func c(): Unit {}
}

open class B {
@OverflowSaturating@OverflowThrowing
    func a(): Unit {}
    @FastNative
    func b(): Unit {}

    protected open func 
    c(): Unit {}
}

class C <: B {
 @OverflowSaturating
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

    func getm(): Unit {}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
