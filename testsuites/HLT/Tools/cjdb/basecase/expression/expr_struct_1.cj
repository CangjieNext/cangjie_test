/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct Rect {
    public var width: Int64
    protected var height: Int64
    private var area: Int64 = 0
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }

    public func test_hm() {
        var hmu8 = HashMap<String, UInt8>([("a", 0), ("b", 1), ("c", 2)])
        var hmu16 = HashMap<String, UInt16>([("a", 0), ("b", 1), ("c", 2)])
        var hmu32 = HashMap<String, UInt32>([("a", 0), ("b", 1), ("c", 2)])
        var hmu64 = HashMap<String, UInt64>([("a", 0), ("b", 1), ("c", 2)])
        var hmuin = HashMap<String, UIntNative>([("a", 0), ("b", 1), ("c", 2)])
        var hm8 = HashMap<String, Int8>([("a", 0), ("b", 1), ("c", 2)])
        var hm16 = HashMap<String, Int16>([("a", 0), ("b", 1), ("c", 2)])
        var hm32 = HashMap<String, Int32>([("a", 0), ("b", 1), ("c", 2)])
        var hm64 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
        var hmin = HashMap<String, IntNative>([("a", 0), ("b", 1), ("c", 2)])
        return 0
    }
}

main(): Int64 {
    var ret = Rect(10, 20)
    ret.test_hm()
    return 0
}
