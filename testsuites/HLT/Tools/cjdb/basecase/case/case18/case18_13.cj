/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public open class Rectangle {
    protected var aaa = 11
    private var bbb = 22
    static private var ccc = 33
    let width: Int64
    let height: Int64
    var name = "rectangle"
    public init(height: Int64) {
        var width2: Int64 = 20
        this.width = width2
        this.height = height
    }
    public func area() {
        width * height
    }
}

public class Cuboid <: Rectangle {
    private var length: Int64
    public init(width: Int64, height: Int64, length: Int64) {
        super(height)
        super.aaa = 2
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
    let arraylist02 = ArrayList<Float64>([1.111, 2.222, 3.3333])
    let classvar02=Cuboid(11,12,13)
    return 0
}
