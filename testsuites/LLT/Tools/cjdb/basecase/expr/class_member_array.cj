// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

var r1 = 0..10 : 1

class Rectangle {
    let width: Int64
    let height: Int64
    var arr1: Array<Int8> = [0, 1, 2]
    var arr2: Array<Range<Int64>> = [r1, r1]

    public init(width: Int64, height: Int64) {
        var arrb: Array<Int16> = [3, 1, 2]
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
