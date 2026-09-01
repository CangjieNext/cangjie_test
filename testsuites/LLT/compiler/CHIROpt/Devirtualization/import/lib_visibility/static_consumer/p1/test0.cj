// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
package test0

public open class OpenBase {
    public open func foo(): Int64 {
        1
    }
}

public class PublicFinal <: OpenBase {
    public func foo(): Int64 {
        2
    }
}
