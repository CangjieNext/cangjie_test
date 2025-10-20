/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

type A<T> = Array<T>
type A02<T> = A<T>
type AL<T> = ArrayList<T>
type AL02<T> = AL<T>
type HSet<T> = HashSet<T>
type For<T> = Range<T>
type VA<T, K> = VArray<Int64, $2>
type HM<K, V> = HashMap<K, V>
type HM2<K, V> = HM<K, V>
type CP<T> = CPointer<T>


public func genericsfun_list<T, T1>(a: T, b: T1): T {
    var gengricsvar = a
    var gengricsvar1 = b
    return gengricsvar
}
public func genericsfun_type<T, T1, T2, T3, T4, T5, T6>(a: T, b: T1, c: T2, d: T3, e: T4, f: T5, g: T6): T {
    var gengricsvar = a
    var gengricsvar1 = b
    var gengricsvar2 = c
    var gengricsvar3 = d
    var gengricsvar4 = e
    var gengricsvar5 = f
    var gengricsvar6 = g
    return gengricsvar
}

main():Int64 {
    var vrange: For<Int64> = 1..10 : 1
    var varr: A<Int64> = [1, 2, 3]
    var varr2 : A02<Float32> = [1.1]
    var vlist: AL<Int64> = AL<Int64>([1, 2, 3])
    var vhm: HM<String, Int64> = HM2<String, Int64>([("a", 1), ("b", 2)])
    var vhs: HSet<Int64> = HSet<Int64>(1, 2, 3)
    var vcptr1 = CP<Int8>()
    var varr1: VA<Int64, Int64> = [1, 2]
    var x1 = genericsfun_type(vrange, vlist, varr, vhm, vhs, vcptr1, varr1)
    var x2 = genericsfun_list(varr2,vhm)
    return 0
}
