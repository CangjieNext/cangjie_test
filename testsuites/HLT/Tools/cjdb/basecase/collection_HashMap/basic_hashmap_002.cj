/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

type A1 = String

type A2 = Float64

type A3 = Bool

type A4 = UInt32

type A5 = Rune

main(): Int64 {
    var map_1: HashMap<Int8, Byte> = HashMap<Int8, Byte>([(-3, 42), (2, 12), (-76, 165)])
    var map_3: HashMap<Int32, A4> = HashMap<Int32, A4>([(-329, 1750), (-910, 1732), (-76, 1675)])
    var map_4: HashMap<Int, UInt> = HashMap<Int64, UInt>([(-759, 17550), (-830, 18972), (906, 32245)])
    var map_6: HashMap<A1, A1> = HashMap<String, A1>([('0', 'a'), ('1', 'b')])
    var map_8: HashMap<Float32, A2> = HashMap<Float32, Float64>(
        [(12.15654, 1.7755560), (2.457563, 1.2545836), (5.6, 35.45778794)])
    var map_9: HashMap<Int32, A5> = HashMap<Int32, A5>([(-29, r'C'), (-10, r'a'), (76, r'N')])
    var map_10: HashMap<Int64, A3> = HashMap<Int64, Bool>([(129, true), (-1560, false), (756, true)])
    var map_11 = HashMap<String, Int64>([('a', 1), ('b', 2)])
    var map_12 = HashMap<A1, A2>([('abc', 1.0), ("bcd", 2.0)])
    var map_14: HashMap<UInt32, A4> = HashMap<A4, UInt32>([(1, 2)])
    0
}
