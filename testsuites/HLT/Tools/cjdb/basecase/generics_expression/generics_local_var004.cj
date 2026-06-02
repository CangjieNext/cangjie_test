/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class C1<T> {
    private var vunit: Unit = ()
    var vrange2: Range<Int32> = 1..6:2
    static var vcarrc2: Array<Int64> = [2]
    var vlist2 = ArrayList<Int64>([1, 2])
    var vhmc = HashMap<String, Bool>([("a", true)])
}

struct S1<T> {
    var vunit: Unit = ()
    public static var vrange2: Range<Int32> = 1..6:2
    var vcarrc2: Array<Int64> = [2]
    static var vlist2 = ArrayList<Int64>([1, 2])
    var vhmc = HashMap<String, Bool>([("a", true)])
}

main(): Int64 {
    var s1 = S1<Int32>()
    var c1 = C1<Bool>()
    return 0
}
