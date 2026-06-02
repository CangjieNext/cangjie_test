// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package M2.pkg2

internal import M1.pkg1.*

public open class Derive1 <: Base {
    public var a2: Int32 = 2
    public init() {}
    public init(a: Int32) {
        this.a2 = a
    }
}

public func foo2() {
    let a = foo1()
    return Derive1(a.a1 + 1)
}
