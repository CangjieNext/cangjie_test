// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkga

import std.collection.*

public struct Inner {
    public var tag: Int64
    public var label: String
    public init(tag: Int64, label: String) {
        this.tag = tag
        this.label = label
    }
    public func describe(): String {
        return "${label}#${tag}"
    }
}

public struct Data<T> {
    public var width: T
    public var height: T
    public var depth: T
    public var origin: Inner
    public var flags: Array<Bool>
    public var names: ArrayList<String>
    public init(width: T, height: T) {
        this.width = width
        this.height = height
        this.depth = width
        this.origin = Inner(1, "pkga-origin")
        this.flags = Array<Bool>(4, repeat: false)
        this.names = ArrayList<String>()
    }
    public func area(): T {
        return width
    }
    public func summary(): String {
        return origin.describe()
    }
    public func isOrigin(): Bool {
        return origin.tag == 1
    }
}

public let defaultLabel: String = "pkga-default"

public var counter: Int64 = 0

public func makeData(w: Int32, h: Int32): Data<Int32> {
    return Data<Int32>(w, h)
}
