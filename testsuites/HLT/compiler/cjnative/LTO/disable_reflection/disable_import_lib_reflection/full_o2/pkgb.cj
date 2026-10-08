// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgb

// 第三个导入库：interface + 泛型 struct + 关联值 enum + 工具函数
public interface Named {
    func name(): String
}

public struct Box3<T> {
    public var x: Int64
    public var y: Int64
    public var z: Int64
    public var label: String
    public var extra: T
    public init(x: Int64, y: Int64, z: Int64, extra: T) {
        this.x = x
        this.y = y
        this.z = z
        this.label = "pkgb-box"
        this.extra = extra
    }
    public func name(): String {
        return label
    }
    public func volume(): Int64 {
        return x * y * z
    }
    public mut func rename(n: String): Unit {
        label = n
    }
}

public class Tagged <: Named {
    public var tag: String
    public init() {
        this.tag = "tagged"
    }
    public func name(): String {
        return tag
    }
}

// 关联值枚举：无参 / 单参 / 双参构造器
public enum Mode {
    | Off
    | On(Int64)
    | Auto(String, Bool)
}

public func modeValue(m: Mode): Int64 {
    return match (m) {
        case Off => 0
        case On(v) => v
        case Auto(_, b) => if (b) { 1 } else { -1 }
    }
}
