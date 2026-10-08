// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

import std.reflect.*

// 多类型反射查询：泛型 struct / class / 原始类型（enum 运行期反射不支持，不使用）
public struct Data<T> {
    public var width: T
    public var height: T
    public var depth: T
    public init(width: T, height: T) {
        this.width = width
        this.height = height
        this.depth = width
    }
    public func area(): T {
        return width
    }
}

public class Shape {
    public var owner: String
    public init() {
        this.owner = "pkgs-shape"
    }
    public func ownerName(): String {
        return owner
    }
}

public class Meta {
    public var version: Int64
    public init() {
        this.version = 1
    }
    public func ver(): Int64 {
        return version
    }
}

public func reflectName(): String {
    return TypeInfo.of<Data<Int32>>().toString()
}

public func reflectShape(): String {
    return TypeInfo.of<Shape>().toString()
}

public func reflectMeta(): String {
    return TypeInfo.of<Meta>().toString()
}

public func reflectInt(): String {
    return TypeInfo.of<Int64>().toString()
}

public func reflectAll(): Bool {
    return !reflectName().isEmpty()
        && !reflectShape().isEmpty()
        && !reflectMeta().isEmpty()
        && !reflectInt().isEmpty()
}
