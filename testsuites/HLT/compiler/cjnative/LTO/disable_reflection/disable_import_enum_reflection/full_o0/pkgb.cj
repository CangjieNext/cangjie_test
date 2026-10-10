// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgb

// 关联值枚举专项 + 泛型 struct
public enum G {
    | A
    | B(Int64)
    | C(String, Bool)
}

public enum H {
    | P(Float64)
    | Q
}

public struct Carrier<T> {
    public var value: T
    public var tag: Int64
    public init(value: T, tag: Int64) {
        this.value = value
        this.tag = tag
    }
    public func get(): T {
        return value
    }
}

public func gValue(g: G): Int64 {
    return match (g) {
        case A => 0
        case B(v) => v
        case C(_, b) => if (b) { 1 } else { -1 }
    }
}

public func hTag(h: H): Int64 {
    return match (h) {
        case P(_) => 1
        case Q => 2
    }
}
