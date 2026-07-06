// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo

common open class Exception {
    common init()
    common func getMessage(): ?String
}

public common class C {
    public let x: Int64 = 42
    common public init() {}
    public func getValue(): Int64 { x }
}