/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Rectangle {
    public var width: Int64
    protected var height: Int64
    private var area: Int64 = 0
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }
    public func test_arrlist() {
        var listi8: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3])
        var listi16: ArrayList<Int16> = ArrayList<Int16>([1, 2, 3])
        var listi32: ArrayList<Int32> = ArrayList<Int32>([1, 2, 3])
        var listi64: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
        var listin: ArrayList<IntNative> = ArrayList<IntNative>([1, 2, 3])
        var listui8: ArrayList<UInt8> = ArrayList<UInt8>([1, 2, 3])
        var listui16: ArrayList<UInt16> = ArrayList<UInt16>([1, 2, 3])
        var listui32: ArrayList<UInt32> = ArrayList<UInt32>([1, 2, 3])
        var listui64: ArrayList<UInt64> = ArrayList<UInt64>([1, 2, 3])
        var listuin: ArrayList<UIntNative> = ArrayList<UIntNative>([1, 2, 3])
        return 0
    }
}

main(): Int64 {
    var ret = Rectangle(10, 20)
    ret.test_arrlist()
    return 0
}
