main(): Unit {}

public open class A {
    public open func foo(): Unit {}
    protected open func bar(): Unit {}

    open public func too(): Unit {}
    private
    func er(): Unit {}

    protected static func moon(): Unit {}
}

interface IC {
    func mat(): Unit {}
}

class B <: A & IC {
    public open  
    func foo(): Unit {}
    protected open override 
    func bar(): Unit {}

    open override public 
    func too(): Unit {}
    override 
    func er(): Unit {}
 
    protected static 
    func moon(): Unit {}
    static redef 
    func fat(): Unit {}

    public override
    func mat(): Unit {}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
