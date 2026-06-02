// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test0

public open class A {
    public init() { // block id: 29
    }
    func foo(param!: Int64 = 1) {
        return 1
    }
}

public func bar<T0>(): Int64 { // block id: 24
    var a = A()
    a.foo()
    return 1
}
