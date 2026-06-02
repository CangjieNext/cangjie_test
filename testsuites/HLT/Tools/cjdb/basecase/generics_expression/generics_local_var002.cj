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

type CP<T> = CPointer<T>

class C1 {
    static var vrange: For<Int64> = 1..10
    public var vrangec: For<Int64> = 1..10
    private var vcarrc: A<Int64> = [1, 2, 3]
    static var vlist = AL<Int64>([1, 2, 3])
    public var vlistc: ArrayList<Int64> = AL<Int64>([1, 2, 3])
    private var vhsc = HSet<Int64>(1, 2, 3)
    static var vhm = HM<String, Int64>([("a", 1), ("b", 2)])
    public var vhmc: HashMap<String, Int64> = HM<String, Int64>([("a", 1), ("b", 2)])
    private var vcpc = CP<Int64>()
}

struct S1 {
    private var vranges: For<Int64> = 1..10
    static var varr: A<Int64> = [1, 2, 3]
    public var varrs: A<Int64> = [1, 2, 3]
    private var vlists = AL<Int64>([1, 2, 3])
    static var vhs = HSet<Int64>(1, 2, 3)
    public var vhss: HashSet<Int64> = HSet<Int64>(1, 2, 3)
    private var vhms = HM<String, Int64>([("a", 1), ("b", 2)])
    static var vcp = CP<Int64>()
    public var vcps: CPointer<Int64> = CP<Int64>()
}

main(): Int64 {
    var s1 = S1()
    var c1 = C1()
    return 0
}
