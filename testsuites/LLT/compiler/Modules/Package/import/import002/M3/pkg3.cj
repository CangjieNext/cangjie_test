// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package M3.pkg3

internal import M2.pkg2.*

public open class Derive3 <: Derive1 {
    public var a3: Int32
    public init(a: Int32) {
        this.a3 = a
    }
}

public func foo3() {
    let a = foo2()
    return Derive3(a.a2 + 1)
}
