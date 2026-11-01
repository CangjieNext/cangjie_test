// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgb

public interface Drawable {
    func draw(): String
}

public open class Widget {
    public var id: Int64
    public init(id: Int64) {
        this.id = id
    }
    public func widgetName(): String {
        return "widget-${id}"
    }
}

public class Panel<T> <: Widget & Drawable {
    public var width: T
    public var height: T
    public var title: String
    public init(width: T, height: T) {
        super(11)
        this.width = width
        this.height = height
        this.title = "panel"
    }
    public func area(): T {
        return width
    }
    public func draw(): String {
        return "${title}#${id}"
    }
    public static func blank(): Panel<Int64> {
        return Panel<Int64>(0, 0)
    }
}
