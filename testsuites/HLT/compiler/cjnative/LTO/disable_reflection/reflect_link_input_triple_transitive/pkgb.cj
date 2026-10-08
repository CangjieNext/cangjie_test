// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgb

public struct Box3<T> {
    public var x: Int64
    public var y: Int64
    public var z: Int64
    public var extra: T
    public init(x: Int64, y: Int64, z: Int64, extra: T) {
        this.x = x
        this.y = y
        this.z = z
        this.extra = extra
    }
    public func volume(): Int64 {
        return x * y * z
    }
}

public enum Mode {
    | Off
    | On(Int64)
}

public func modeValue(m: Mode): Int64 {
    return match (m) {
        case Off => 0
        case On(v) => v
    }
}
