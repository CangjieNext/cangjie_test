// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package libb

public func greetB(): String {
    return "libb"
}

public struct ItemB {
    public var value: Int64
    public init(value: Int64) {
        this.value = value
    }
    public func doubled(): Int64 {
        return value * 2
    }
    public func tripled(): Int64 {
        return value * 3
    }
}
