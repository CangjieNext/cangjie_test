// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgb

public interface Drawable {
    func draw(): String
}

public class Circle <: Drawable {
    public var radius: Int64
    public var label: String
    public var center: Int64
    public init(radius: Int64, label: String) {
        this.radius = radius
        this.label = label
        this.center = 0
    }
    public func draw(): String {
        return "${label}#${radius}"
    }
    public func area(): Int64 {
        return radius * radius
    }
    public func moveTo(c: Int64): Unit {
        center = c
    }
}