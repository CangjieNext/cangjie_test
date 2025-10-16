package test

public open class A {
	public open func Foo() { return 1 }
}

public open class Q <: A {
    public open func goo(a:Int64, b:Int64) {return 1}
	public override func Foo() { return 3 }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
