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
    public var iv: Int32 = 7
    public var lv: Int64 = -3
    public let cv: Int32 = 11
    common public init()
    public func sum(): Int64 {
        return Int64(iv) + lv + Int64(cv)
    }
}
