/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func foo<T>(para: T, para2: Int64, para3!: Bool = true) {
    var a: T = para
    var b = para2
    return a
}

main(): Int64 {
    var vrange: Range<Int32> = 1..10 : 1
    var varr: Array<UInt64> = [1, 2, 3]
    var vlist: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3])
    var vhm: HashMap<String, UInt32> = HashMap<String, UInt32>([("a", 1), ("b", 2)])
    var vhs = HashSet<Int64>(1, 2, 3)
    var varr1: VArray<Int64, $2> = [1, 2]
    var x1 = foo(vrange,6)
    var x2 = foo<Array<UInt64>>(varr,6)
    var x3 = foo(vlist,4)
    var x4 = foo(vhm,2)
    var x5 = foo(vhs,3)
    var x6 = foo(varr1,6)
    return 0
}
