/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Rectangle {
    public var hm8: HashMap<String, Int8> = HashMap<String, Int8>([("a", 0), ("b", 1), ("c", 2)])
    public var hm16: HashMap<String, Int16> = HashMap<String, Int16>([("a", 0), ("b", 1), ("c", 2)])
    public var hm32: HashMap<String, Int32> = HashMap<String, Int32>([("a", 0), ("b", 1), ("c", 2)])
    public var hm64: HashMap<String, Int64> = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    public var hmin: HashMap<String, IntNative> = HashMap<String, IntNative>([("a", 0), ("b", 1), ("c", 2)])
    public var width: Int64
    protected var height: Int64
    private var area: Int64 = 0
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }
}
main(): Int64 {
    var ret = Rectangle(10, 20)

    return 0
}
