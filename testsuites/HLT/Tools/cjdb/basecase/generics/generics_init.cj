/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

type F64 = Float64

type Bl = Bool

type I32 = Int32

open class Rect2<T, T1, T2> {
    Rect2(a: T, b: T1, c: T2) {
        var a1 = a
        var a2 = b
        var a3 = c
    }
    public open func ftuple(a: T) {
        var a1 = a
        return 0
    }
}

struct Sect1<T, T3> {
    Sect1(a: T) {
        var a1 = a
    }

    public func fstr(a: T, b: T3) {
        var a1 = a
        var a2 = b
        return 0
    }
}

main() {
    var t1 = Rect2<I32, Bl, F64>(6, true, 6.6)
    var t2 = Sect1<Int64, F64>(8)
    var t3 = t1.ftuple(5)
    var t4 = t2.fstr
    var t5 = t2.fstr(2, 1.2)
    return 0
}
