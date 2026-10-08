// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

import std.collection.*

// 混合形态：泛型 struct + 继承接口的泛型 class + 两个关联值 enum + 工厂/泛型函数
public struct Data<T> {
    public var width: T
    public var height: T
    public var depth: T
    public var origin: String
    public var flags: Array<Bool>
    public var tags: ArrayList<String>
    public init(width: T, height: T) {
        this.width = width
        this.height = height
        this.depth = width
        this.origin = "origin"
        this.flags = Array<Bool>(4, repeat: false)
        this.tags = ArrayList<String>()
    }
    public func area(): T {
        return width
    }
    public func stamp(tag: String): Unit {
        tags.add(tag)
    }
}

public interface Describable {
    func describe(): String
}

public open class Shape<T> <: Describable {
    public var width: T
    public var height: T
    public var depth: T
    public var owner: String
    public init(width: T, height: T) {
        this.width = width
        this.height = height
        this.depth = width
        this.owner = "shape"
    }
    public func area(): T {
        return width
    }
    public func describe(): String {
        return owner
    }
}

// 注意：E.A 为第 1 个构造器（tag() == 1 断言依赖此顺序），勿调序
public enum E {
    | A
    | B(Int64)
    | C(String, Bool)
}

// 注意：F.A 为第 3 个构造器（tag() == 3 断言依赖此顺序），勿调序
public enum F {
    | X
    | Y
    | A(Int32)
}

public class Box <: Shape<Int64> {
    public var sealed: Bool
    public init(w: Int64, h: Int64) {
        super(w, h)
        this.sealed = true
    }
    public func unseal(): Unit {
        sealed = false
    }
    public func sealedArea(): Int64 {
        if (sealed) {
            return area() * 2
        }
        return area()
    }
}

public var instanceCount: Int64 = 0

public func makeBox(w: Int64, h: Int64): Box {
    instanceCount += 1
    return Box(w, h)
}

public func identity<T>(v: T): T {
    return v
}

public func tagE(e: E): Int64 {
    return match (e) {
        case A => 1
        case B(_) => 2
        case C(_, _) => 3
    }
}
public func tagF(f: F): Int64 {
    return match (f) {
        case X => 1
        case Y => 2
        case A(_) => 3
    }
}
