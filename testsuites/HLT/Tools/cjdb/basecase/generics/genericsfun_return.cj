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

func test_t<T>(a: T) {
    return a
}

const func test_t1<T>(a: T) {
    return a
}

class C1 {
    static var vint = test_t<Int64>(64)
    public var vintc: Int32 = test_t<Int32>(32)
    private var vUintc = test_t<UInt16>(16)
    static var vf = test_t<Float32>(32.32)
    public var vfc: Float64 = test_t<Float64>(64.64)
    private var vbc = test_t<Bool>(true)
    static var vr = test_t<Rune>(r'a')
    public var vrc: Rune = test_t<Rune>(r'a')
    private var vtc = test_t<(Int8, UInt16)>((10, 20))
    static var vu = test_t<Unit>(())
    public var vuc: Unit = test_t<Unit>(())
    private var vcstrc = test_t<CString>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
    static var vstr = test_t<String>("Cangjie")
    public var vstrc: String = test_t<String>("Cangjie")
    private var vcfunc = test_t<CFunc<() -> Unit>>(CFunc<() -> Unit>(CPointer<Int8>()))
    static var vrange = test_t<For<Int64>>(1..10)
    public var vrangec: Range<Int64> = test_t<For<Int64>>(1..10)
    private var vcarrc = test_t<A<Int64>>([1, 2, 3])
    static var vlist = test_t<AL<Int64>>(AL<Int64>([1, 2, 3]))
    public var vlistc: ArrayList<Int64> = test_t<AL<Int64>>(AL<Int64>([1, 2, 3]))
    private var vhsc = test_t<HSet<Int64>>(HSet<Int64>(1, 2, 3))
    static var vhm = test_t<HM<String, Int64>>(HM<String, Int64>([("a", 1), ("b", 2)]))
    public var vhmc: HashMap<String, Int64> = test_t<HM<String, Int64>>(HM<String, Int64>([("a", 1), ("b", 2)]))
    private var vcpc = test_t<CP<Int64>>(CP<Int64>())
}

struct S1 {
    private var vints = test_t<Int16>(16)
    static var vuint = test_t<UInt64>(64)
    public var vuints: UInt32 = test_t<UInt32>(32)
    private var vfs = test_t<Float16>(16.16)
    static var vb = test_t<Bool>(true)
    public var vbs: Bool = test_t<Bool>(true)
    private var vrs = test_t<Rune>(r'a')
    static var vt = test_t<(Int8, UInt16)>((10, 20))
    protected var vts = test_t<(Int8, UInt16)>((10, 20))
    private var vus = test_t<Unit>(())
    static var vcstr = test_t<CString>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
    public var vcstrs: CString = test_t<CString>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
    private var vstrs = test_t<String>("Cangjie")
    static var vcfun = test_t<CFunc<() -> Unit>>(CFunc<() -> Unit>(CPointer<Int8>()))
    protected var vcfuns = test_t<CFunc<() -> Unit>>(CFunc<() -> Unit>(CPointer<Int8>()))
    private var vranges = test_t<For<Int64>>(1..10)
    static var varr = test_t<A<Int64>>([1, 2, 3])
    public var varrs: Array<Int64> = test_t<A<Int64>>([1, 2, 3])
    private var vlists = test_t<AL<Int64>>(AL<Int64>([1, 2, 3]))
    static var vhs = test_t<HSet<Int64>>(HSet<Int64>(1, 2, 3))
    public var vhss: HashSet<Int64> = test_t<HSet<Int64>>(HSet<Int64>(1, 2, 3))
    private var vhms = test_t<HM<String, Int64>>(HM<String, Int64>([("a", 1), ("b", 2)]))
    static var vcp = test_t<CP<Int64>>(CP<Int64>())
    public var vcps: CPointer<Int64> = test_t<CP<Int64>>(CP<Int64>())
}

var globals_vint = test_t<IntNative>(100)
var globals_vUint = test_t<UIntNative>(100)
var globals_vf = test_t<Float32>(32.32)
var globals_vb = test_t<Bool>(true)
var globals_vr = test_t<Rune>(r'a')
var globals_vt = test_t<(Int8, UInt16)>((10, 20))
var globals_vu = test_t<Unit>(())
var globals_cstr = test_t<CString>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
var globals_str = test_t<String>("Cangjie")
var globals_cfun = test_t<CFunc<() -> Unit>>(CFunc<() -> Unit>(CPointer<Int8>()))
var globals_range = test_t<For<Int64>>(1..10)
var globals_arr = test_t<A<Int64>>([1, 2, 3])
var globals_list = test_t<AL<Int64>>(AL<Int64>([1, 2, 3]))
var globals_hs = test_t<HSet<Int64>>(HSet<Int64>(1, 2, 3))
var globals_hm = test_t<HM<String, Int64>>(HM<String, Int64>([("a", 1), ("b", 2)]))
var globals_cp = test_t<CP<Int64>>(CP<Int64>())

main() {
    let lint = test_t<Int8>(8)
    let luint = test_t<UInt8>(8)
    let lf = test_t<Float16>(16.16)
    let lb = test_t<Bool>(true)
    let lr = test_t<Rune>(r'a')
    let lt = test_t<(Int8, UInt16)>((10, 20))
    let lu = test_t<Unit>(())
    let lstr = test_t<String>("Cangjie")
    let lcstr = test_t<CString>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
    let lcfun = test_t<CFunc<() -> Unit>>(CFunc<() -> Unit>(CPointer<Int8>()))
    let lrange = test_t<For<Int64>>(1..10)
    let larr = test_t<A<Int64>>([1, 2, 3])
    let llist = test_t<AL<Int64>>(AL<Int64>([1, 2, 3]))
    let lhs = test_t<HSet<Int64>>(HSet<Int64>(1, 2, 3))
    let lhm = test_t<HM<String, Int64>>(HM<String, Int64>([("a", 1), ("b", 2)]))
    let lcp = test_t<CP<Int64>>(CP<Int64>())
    var s1 = S1()
    var c1 = C1()
    const cvuint = test_t1<UInt8>(8)
    const cvint = test_t1<Int8>(8)
    const cvf = test_t1<Float16>(16.16)
    const cvb = test_t1<Bool>(false)
    const cvr = test_t1<Rune>(r'a')
    const cvt = test_t1<(Int8, UInt16)>((10, 20))
    const cvu = test_t1<Unit>(())
    const cvstr = test_t1<String>("Cangjie")
    var tt = 0
    var test_lambda = {
        a: Int16, b: UInt16, c: Float32, d: Bool, e: Rune, f: (Int8, UInt16), g: Unit, h: CString =>
        var test_a = a
        var test_b = b
        var test_c = c
        var test_d = d
        var test_e = e
        var test_f = f
        var test_g = g
        var test_h = h
        print("${a}\n")
        print(b)
    }(test_t<Int16>(16), test_t<UInt16>(16), test_t<Float32>(32.32), test_t<Bool>(true), test_t<Rune>(r'a'),
        test_t<(Int8, UInt16)>((10, 20)), test_t<Unit>(()),
        test_t<CString>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") }))
    var test_lambda1 = {
        a: String, b: CFunc<() -> Unit>, c: For<Int64>, d: A<Int64>, e: AL<Int64>, f: HSet<Int64>, g: HM<String, Int64>,
        h: CP<Int64> =>
        var test_a = a
        var test_b = b
        var test_c = c
        var test_d = d
        var test_e = e
        var test_f = f
        var test_g = g
        var test_h = h
        print("${a}\n")
    }(test_t<String>("Cangjie"), test_t<CFunc<() -> Unit>>(CFunc<() -> Unit>(CPointer<Int8>())),
        test_t<For<Int64>>(1..10), test_t<A<Int64>>([1, 2, 3]), test_t<AL<Int64>>(AL<Int64>([1, 2, 3])),
        test_t<HSet<Int64>>(HSet<Int64>(1, 2, 3)), test_t<HM<String, Int64>>(HM<String, Int64>([("a", 1), ("b", 2)])),
        test_t<CP<Int64>>(CP<Int64>()))
    return 0
}

