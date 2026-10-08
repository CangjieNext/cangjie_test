// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

import std.reflect.*

// 反射提供方：链接输入中 std.reflect 依赖的源头
public func typeNameOfInt(): String {
    return TypeInfo.of<Int64>().toString()
}

public func typeNameOfFloat(): String {
    return TypeInfo.of<Float64>().toString()
}

public struct Data {
    public var width: Int64
    public var height: Int64
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }
    public func area(): Int64 {
        return width * height
    }
}
