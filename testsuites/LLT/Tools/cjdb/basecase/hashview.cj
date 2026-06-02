// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

struct Rectangle {
    var a: Rune = r'a'
    let str = "Hello Cangjie"
    var b = false
    let int_16: Int16 = 16
    var al: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
    let hs = HashSet<Bool>([false, true])
    var hm = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let r = 0..10 : 1
}

func test01<T>(a: T): T {
    return a
}

main(): Int64 {
    var aaa = HashMap<Rune, Rectangle>([(r'a', Rectangle()), (r'b', Rectangle())])
    test01<HashMap<Rune, Rectangle>>(aaa)
    return 0
}
