/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

type A1 = String

func test1(a: HashMap<Int8, UInt8>) {
    var b = a
    0
}

func test2<T>(a: HashMap<Int, T>) {
    var b = a
    0
}

main() {
    var map_1: HashMap<Int8, UInt8> = HashMap<Int8, UInt8>([(-3, 42), (2, 12), (-76, 165)])
    var map_2 = HashMap<Int, A1>([(1, 'abc'), (2, "bcd")])
    test1(map_1)
    test2<String>(map_2)
    test2<String>(HashMap<Int, A1>([(1, 'abc'), (2, "bcd")]))
    0
}
