/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

class Pair<T1, T2> {
    var first: T1
    var second: T2
    init(a: T1, b: T2) {
        first = a
        second = b
    }
}
interface Eq<T> {
    func equals1(other: T): Bool
}

extend<T1, T2> Pair<T1, T2> where T1 <: Eq<T1>, T2 <: Eq<T2> {
    func equals(other: Pair<T1, T2>) {
        first.equals1(other.first) && second.equals1(other.second)
    }
}

func f4() {
    var m1 = Pair<Int32, Int64>(1, 8)
    m1.first
}
