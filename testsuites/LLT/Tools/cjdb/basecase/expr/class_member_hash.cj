// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

class Rectangle {
    let width: Int64
    let height: Int64
    let mapa = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let seta = HashSet<Int32>([0, 1, 2])

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}

main() {
    var r = Rectangle(4, 5)
    r.area()
}
