/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Rectangle {
    public var arru8: Array<UInt8> = [1, 2, 3]
    private var arru16: Array<UInt16> = [1, 2, 3]
    public var arru32: Array<UInt32> = [1, 2, 3]
    private var arru64: Array<UInt64> = [1, 2, 3]
    public var arruin: Array<UIntNative> = [1, 2, 3]
    public var arr8: Array<Int8> = [1, 2, 3]
    private var arr16: Array<Int16> = [1, 2, 3]
    public var arr32: Array<Int32> = [1, 2, 3]
    private var arr64: Array<Int64> = [1, 2, 3]
    public var arrin: Array<IntNative> = [1, 2, 3]
    public var width: Int64
    protected var height: Int64
    private var area: Int64 = 0
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
        this.area = this.width * this.height
    }
    public func test_int() {
        var lInt8: Int8 = 8
        var lInt16: Int16 = 16
        var lInt32: Int32 = 32
        var lInt64: Int64 = 64
        var lIntN: IntNative = 100
        return 0
    }
    public func test_uint() {
        var lUInt8: UInt8 = 8
        var lUInt16: UInt16 = 16
        var lUInt32: UInt32 = 32
        var lUInt64: UInt64 = 64
        var lUIntN: UIntNative = 100
        return 0
    }
}

main(): Int64 {
    var ret = Rectangle(10, 20)
    ret.test_int()
    ret.test_uint()
    return 0
}
