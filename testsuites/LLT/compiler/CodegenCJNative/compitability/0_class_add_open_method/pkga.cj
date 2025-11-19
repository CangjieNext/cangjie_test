// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package lib.pkgA

public open class CA {
    public open func foo(): Unit { println(1) }
}

public func test(ins: CA): Unit {
    ins.foo()
}