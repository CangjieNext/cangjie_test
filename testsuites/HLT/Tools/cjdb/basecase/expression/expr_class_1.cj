/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Rectangle {
    public var hmu8: HashMap<String, UInt8> = HashMap<String, UInt8>([("a", 0), ("b", 1), ("c", 2)])
    public var hmu16: HashMap<String, UInt16> = HashMap<String, UInt16>([("a", 0), ("b", 1), ("c", 2)])
    public var hmu32: HashMap<String, UInt32> = HashMap<String, UInt32>([("a", 0), ("b", 1), ("c", 2)])
    public var hmu64: HashMap<String, UInt64> = HashMap<String, UInt64>([("a", 0), ("b", 1), ("c", 2)])
    public var hmuin: HashMap<String, UIntNative> = HashMap<String, UIntNative>([("a", 0), ("b", 1), ("c", 2)])
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
    // ret.test_arrlist()
    return 0
}
