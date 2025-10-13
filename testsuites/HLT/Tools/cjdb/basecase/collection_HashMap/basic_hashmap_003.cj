import std.collection.*

type A1 = String

class C1 {
    var map_1: HashMap<Int8, UInt8> = HashMap<Int8, UInt8>([(-3, 42), (2, 12), (-76, 165)])
    var map_2: HashMap<Int16, UInt16> = HashMap<Int16, UInt16>([(-39, 150), (-90, 1662), (76, 675)])
    var map_3: HashMap<Int32, UInt32> = HashMap<Int32, UInt32>([(-329, 1750), (-910, 1732), (-76, 1675)])
    var map_4: HashMap<Int64, UInt> = HashMap<Int64, UInt64>([(-759, 17550), (-830, 18972), (906, 32245)])
    var map_5: HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(12, 17750), (23, 1836), (56, 3594)])
    var map_6: HashMap<String, String> = HashMap<String, String>([('0', 'a'), ('1', 'b')])
    var map_7: HashMap<Float16, Float32> = HashMap<Float16, Float32>([(1.2, 17.750), (2.3, 1.836), (5.6, 3.594)])
    var map_8: HashMap<Float32, Float64> = HashMap<Float32, Float64>(
        [(12.15654, 1.7755560), (2.457563, 1.2545836), (5.6, 35.45778794)])
    var map_9: HashMap<Int32, Rune> = HashMap<Int32, Rune>([(-29, r'C'), (-10, r'a'), (76, r'N')])
    var map_10: HashMap<Int64, Bool> = HashMap<Int64, Bool>([(129, true), (-1560, false), (756, true)])
    var map_11 = HashMap<A1, Int64>([('a', 1), ('b', 2)])
    var map_12 = HashMap<String, Float64>([('abc', 1.0), ("bcd", 2.0)])
    var map_13: HashMap<Float16, Int16> = HashMap<Float16, Int16>([(1.2, 17), (2.3, 1), (5.6, 3)])
    var map_14: HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>()
}

main() {
    var a1 = C1()
    var b1 = a1.map_1
    var b2 = a1.map_2
    var b3 = a1.map_3
    var b4 = a1.map_4
    var b5 = a1.map_5
    var b6 = a1.map_6
    var b11 = a1.map_11
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
