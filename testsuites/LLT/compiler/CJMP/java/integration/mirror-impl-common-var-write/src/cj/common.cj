// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo

common open class Base {
    common init()
}

public common class C {
    public var value: Int32
    common public init()
    public func bump(): Int32 {
        value += 1
        value
    }
}
