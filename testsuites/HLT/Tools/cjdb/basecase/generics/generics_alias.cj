/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct structtype01<T> {
    var a: T
    public init(x: T) {
        a = x
    }
}

public class classtype01<T> {
    var a: T
    public init(x: T) {
        a = x
    }
}

type A<T> = Array<T>

type A02<T> = A<T>

type AL<T> = ArrayList<T>

type AL02<T> = AL<T>

type HSet<T> = HashSet<T>

type For<T> = Range<T>

type VA<T, K> = VArray<Int64, $2>

type HM<K, V> = HashMap<K, V>

type CP<T> = CPointer<T>

type ST<T> = structtype01<T>

type CT<T> = classtype01<T>

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
    static var vst = ST<Int64>(10)
    public var vstc: structtype01<Int64> = ST<Int64>(10)
    private var vctc = CT<Int64>(10)
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
    private var vsts = ST<Int64>(10)
    static var vct = CT<Int64>(10)
    public var vcts: classtype01<Int64> = CT<Int64>(10)
}

var globals_range = For<Int64>(1, 10, 1, true, true, true)
var globals_arr: A<Int64> = [1, 2, 3]
var globals_list = AL<Int64>([1, 2, 3])
var globals_hs = HSet<Int64>(1, 2, 3)
var globals_hm = HM<String, Int64>([("a", 1), ("b", 2)])
var globals_cp = CP<Int64>()
var globals_st = ST<Int32>(32)
var globals_ct = CT<Int32>(16)

main() {
    let lrange = For<Int64>(1, 10, 1, true, true, true)
    let larr: A<Int64> = [1, 2, 3]
    let llist = AL<Int64>([1, 2, 3])
    let lhs = HSet<Int64>(1, 2, 3)
    let lhm = HM<String, Int64>([("a", 1), ("b", 2)])
    let lcp = CP<Int64>()
    let lst = ST<Int32>(32)
    let lct = CT<Int32>(16)
    var s1 = S1()
    var c1 = C1()
    const crange: For<Int64> = Range<Int64>(1, 10, 1, true, true, true)
    var tt = 0
    var test_lambda = {
        a: For<Int64>, b: A<Int64>, c: AL<Int64>, d: HSet<Int64>, e: HM<String, Int64>, f: CP<Int64>, g: ST<Int32>, h: CT<Int32> =>
        var test_a = a
        var test_b = b
        var test_c = c
        var test_d = d
        var test_e = e
        var test_f = f
        var test_g = g
        var test_h = h
        print("nn")
    }(lrange, larr, llist, lhs, lhm, lcp, lst, lct)
    return 0
}
