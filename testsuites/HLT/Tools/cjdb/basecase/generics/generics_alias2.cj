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

type A1<T> = A<T>

type AL<T> = ArrayList<T>

type AL1<T> = AL<T>

type HSet<T> = HashSet<T>

type HSet1<T> = HSet<T>

type For<T> = Range<T>

type For1<T> = For<T>

type VA<T, K> = VArray<Int64, $2>

type VA1<T, K> = VA<T, K>

type HM<K, V> = HashMap<K, V>

type HM1<K, V> = HM<K, V>

type CP<T> = CPointer<T>

type CP1<T> = CP<T>

type ST<T> = structtype01<T>

type ST1<T> = ST<T>

type CT<T> = classtype01<T>

type CT1<T> = CT<T>

class C1 {
    static var vrange: For1<Int64> = 1..10
    public var vrangec: For1<Int64> = 1..10
    private var vrange1c: For1<Int64> = For<Int64>(1, 10, 1, true, true, true)
    private var vcarrc: A1<Int64> = [1, 2, 3]
    static var vlist: AL1<Int64> = ArrayList<Int64>([1, 2, 3])
    public var vlistc: AL1<Int64> = ArrayList<Int64>([1, 2, 3])
    private var vlist1c: AL1<Int64> = AL<Int64>([1, 2, 3])
    static var vhs1: HSet1<Int64> = HSet<Int64>(1, 2, 3)
    public var vhs1c: HSet1<Int64> = HSet<Int64>(1, 2, 3)
    private var vhsc: HSet1<Int64> = HashSet<Int64>(1, 2, 3)
    static var vhm: HM1<String, Int64> = HashMap<String, Int64>([("a", 1), ("b", 2)])
    public var vhmc: HM1<String, Int64> = HashMap<String, Int64>([("a", 1), ("b", 2)])
    private var vhm1c: HM1<String, Int64> = HM<String, Int64>([("a", 1), ("b", 2)])
    static var vcp1: CP1<Int64> = CP<Int64>()
    public var vcp1c: CP1<Int64> = CP<Int64>()
    private var vcpc = CPointer<Int64>()
    static var vst: ST1<Int64> = structtype01<Int64>(10)
    public var vstc: ST1<Int64> = structtype01<Int64>(10)
    private var vst1c: ST1<Int64> = ST<Int64>(10)
    static var vct1: CT1<Int64> = CT<Int64>(10)
    public var vct1c: CT1<Int64> = CT<Int64>(10)
    private var vctc: CT1<Int64> = classtype01<Int64>(10)
}

struct S1 {
    static var vrange1: For1<Int64> = For<Int64>(1, 10, 1, true, true, true)
    public var vrange1s: For1<Int64> = For<Int64>(1, 10, 1, true, true, true)
    private var vranges: For<Int64> = 1..10
    static var varr: A1<Int64> = [1, 2, 3]
    public var varrs: A1<Int64> = [1, 2, 3]
    static var vlist1: AL1<Int64> = AL<Int64>([1, 2, 3])
    public var vlist1s: AL1<Int64> = AL<Int64>([1, 2, 3])
    private var vlists: AL1<Int64> = ArrayList<Int64>([1, 2, 3])
    static var vhs: HSet1<Int64> = HashSet<Int64>(1, 2, 3)
    public var vhss: HSet1<Int64> = HashSet<Int64>(1, 2, 3)
    private var vhs1s: HSet1<Int64> = HSet<Int64>(1, 2, 3)
    static var vhm1: HM1<String, Int64> = HM<String, Int64>([("a", 1), ("b", 2)])
    public var vhm1s: HM1<String, Int64> = HM<String, Int64>([("a", 1), ("b", 2)])
    private var vhms: HM1<String, Int64> = HashMap<String, Int64>([("a", 1), ("b", 2)])
    static var vcp: CP1<Int64> = CPointer<Int64>()
    public var vcps: CP1<Int64> = CPointer<Int64>()
    private var vcp1s: CP1<Int64> = CP<Int64>()
    static var vst1: ST1<Int64> = ST<Int64>(10)
    public var vst1s: ST1<Int64> = ST<Int64>(10)
    private var vsts = structtype01<Int64>(10)
    static var vct: CT1<Int64> = classtype01<Int64>(10)
    public var vcts: CT1<Int64> = classtype01<Int64>(10)
    private var vct1s: CT1<Int64> = CT<Int64>(10)
}

var globals_range: For1<Int64> = For<Int64>(1, 10, 1, true, true, true)
var globals_range1: For1<Int64> = Range<Int64>(1, 10, 1, true, true, true)
var globals_arr: A<Int64> = [1, 2, 3]
var globals_list: AL1<Int64> = AL<Int64>([1, 2, 3])
var globals_list1: AL1<Int64> = ArrayList<Int64>([1, 2, 3])
var globals_hs: HSet1<Int64> = HSet<Int64>(1, 2, 3)
var globals_hs1: HSet1<Int64> = HashSet<Int64>(1, 2, 3)
var globals_hm: HM1<String, Int64> = HM<String, Int64>([("a", 1), ("b", 2)])
var globals_hm1: HM1<String, Int64> = HashMap<String, Int64>([("a", 1), ("b", 2)])
var globals_cp: CP1<Int64> = CP<Int64>()
var globals_cp1: CP1<Int64> = CPointer<Int64>()
var globals_st: ST1<Int32> = ST<Int32>(32)
var globals_st1: ST1<Int32> = structtype01<Int32>(32)
var globals_ct: CT1<Int32> = CT<Int32>(16)
var globals_ct1: CT1<Int32> = classtype01<Int32>(16)

main() {
    let lrange: For1<Int64> = For<Int64>(1, 10, 1, true, true, true)
    let lrange1: For1<Int64> = Range<Int64>(1, 10, 1, true, true, true)
    let larr: A1<Int64> = [1, 2, 3]
    let llist: AL1<Int64> = AL<Int64>([1, 2, 3])
    let llist1: AL1<Int64> = ArrayList<Int64>([1, 2, 3])
    let lhs: HSet1<Int64> = HSet<Int64>(1, 2, 3)
    let lhs1: HSet1<Int64> = HashSet<Int64>(1, 2, 3)
    let lhm: HM1<String, Int64> = HM<String, Int64>([("a", 1), ("b", 2)])
    let lhm1: HM1<String, Int64> = HashMap<String, Int64>([("a", 1), ("b", 2)])
    let lcp: CP1<Int64> = CP<Int64>()
    let lcp1: CP1<Int64> = CPointer<Int64>()
    let lst: ST1<Int32> = ST<Int32>(32)
    let lst1: ST1<Int32> = structtype01<Int32>(32)
    let lct: CT1<Int32> = CT<Int32>(16)
    let lct1: CT1<Int32> = classtype01<Int32>(16)
    var s1 = S1()
    var c1 = C1()
    const crange: For<Int64> = Range<Int64>(1, 10, 1, true, true, true)
    var tt = 0
    var test_lambda = {
        a: For1<Int64>, b: A1<Int64>, c: AL1<Int64>, d: HSet1<Int64>, e: HM1<String, Int64>, f: CP1<Int64>, g: ST1<Int32>,
        h: CT1<Int32> =>
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
    var test_lambda1 = {
        a: For1<Int64>, b: A1<Int64>, c: AL1<Int64>, d: HSet1<Int64>, e: HM1<String, Int64>, f: CP1<Int64>, g: ST1<Int32>,
        h: CT1<Int32> =>
        var test_a = a
        var test_b = b
        var test_c = c
        var test_d = d
        var test_e = e
        var test_f = f
        var test_g = g
        var test_h = h
        print("nn")
    }(lrange1, larr, llist1, lhs1, lhm1, lcp1, lst1, lct1)
    return 0
}
