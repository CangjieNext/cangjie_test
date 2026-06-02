// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

enum RGBColor<T> {
    Red
    func name<T>(para:T) {
        var a:T = para
        var vlist2 = ArrayList<Int64>([1, 2])
        return a
    }
    func name() {
        var vhmc = HashMap<String, Bool>([("a", true)])
    }
}

enum RGBColor2<T,R> {
    Green(T,R)
    func name<T>(para:T) {
        var a:T = para
        var vcarrc2: Array<Int64> = [2]
        var vlist2 = ArrayList<Int64>([1, 2])
        return a
    }
    func name() {
        var vhmc = HashMap<String, Bool>([("a", true)])
    }

}


main(): Int64 {
    let r1= RGBColor<Int32>.Red.name()
    let r2 = RGBColor<Int32>.Red.name<Int64>(1)
    let r3 = Green(3, 1.0).name()
    let r4 = Green(true, 1.0).name<Int32>(2)
    return 0
}