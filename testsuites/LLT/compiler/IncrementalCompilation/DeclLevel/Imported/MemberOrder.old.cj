package p
public open class A {
    let a: Int32 = 1
    protected var b: Int64 = 2

    public open func foo(): Int64 { 1 }
    public open func bar(): Int64 { 0 }
}

struct B {
    private let a: Int64 = 1
    public var b: Int32 = -54
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
