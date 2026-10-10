// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

// 接口 + open 基类 + 泛型子类（prop / 静态 / 多态）
// 保留符号锚点 pkgs:Shape.tt.fieldnames / reflect.dbg / method0
public interface Measurable {
    prop perimeter: Int64
    func scale(factor: Int64): Measurable
}

public open class Base {
    public var id: Int64
    public init(id: Int64) {
        this.id = id
    }
    public func identify(): String {
        return "base-${id}"
    }
}

public class Shape<T> <: Base & Measurable {
    public var width: T                      // 锚点字段
    public var height: T                     // 锚点字段
    public var depth: T
    public var owner: String
    public init(width: T, height: T) {
        super(7)
        this.width = width
        this.height = height
        this.depth = width
        this.owner = "pkgs"
    }
    public func area(): T {                  // 锚点方法
        return width
    }
    public func ownerTag(): String {
        return "${owner}-${id}"
    }
    public prop perimeter: Int64 {
        get() {
            return id * 4
        }
    }
    public func scale(factor: Int64): Measurable {
        return Shape<Int64>(factor * id, factor * id)
    }
    public static func zero(): Shape<Int64> {
        return Shape<Int64>(0, 0)
    }
}

public let shapeOwner: String = "pkgs-static"

public var shapeCount: Int64 = 0

public func makeShape(w: Int32, h: Int32): Shape<Int32> {
    shapeCount += 1
    return Shape<Int32>(w, h)
}
