// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

public open class Rectangle { // Object
    let width: Int64
    let height: Int64
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}

public class Cuboid <: Rectangle {
    private var length: Int64
    public init(width: Int64, height: Int64, length: Int64) {
        super(width, height)
        this.length = length
    }
    public func volume() {
        
        this.width * this.height * this.length
    }
    static func test(len: Int64) {
        return len
    }
}

main(): Int64 {
    let classvar02 = Cuboid(11, 12, 13)
    let aaa = Cuboid.test(1)
    return 0
}
