// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

public open class Rect2<T> {
    public open func ftuple(a: T) {
        var a1 = a
        var var1: Int8 = -128
        var vInt8: VArray<Int8, $3> = [-1, -2, -3]
        var vrange2: Range<Int32> = 1..6 : 2
        var vcarrc2: Array<Int64> = [2]
        return a1
    }
}

struct S2<T> {
    func ftuple(a: T) {
        var vlist2 = ArrayList<Int64>([1, 2])
        var vhmc = HashMap<String, Bool>([("a", true)])
        return a
    }
}

main(): Int64 {
    var a1 = Rect2<Int64>().ftuple(2)
    var a2 = S2<Int64>().ftuple(2)
    return 0
}
