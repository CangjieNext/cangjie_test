/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
class Rectangle{
    var hmu8 = HashMap<String, UInt8>([("a", 0), ("b", 1), ("c", 2)])
    var hmu16 = HashMap<String, UInt16>([("a", 0), ("b", 1), ("c", 2)])
    var hmu32 = HashMap<String, UInt32>([("a", 0), ("b", 1), ("c", 2)])
    var hmu64 = HashMap<String, UInt64>([("a", 0), ("b", 1), ("c", 2)])
    var hmuin = HashMap<String, UIntNative>([("a", 0), ("b", 1), ("c", 2)])

}
main(): Int64 {
    var rec = Rectangle()
    println("hello world")
    return 0
}
