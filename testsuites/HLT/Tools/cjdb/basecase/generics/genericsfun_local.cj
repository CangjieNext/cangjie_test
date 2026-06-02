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

public func genericsfun_int<T, T1, T2, T3, T4>(a: T, b: T1, c: T2, d: T3, e: T4): Int64 {
    func test_int<T, T1, T2, T3, T4>(a: T, b: T1, c: T2, d: T3, e: T4) {
        var gengricsvar = a
        var gengricsvar1 = b
        var gengricsvar2 = c
        var gengricsvar3 = d
        var gengricsvar4 = e
        return gengricsvar
    }
    var testa = test_int(a, b, c, d, e)
    return 0
}

public func genericsfun_uint<T, T1, T2, T3, T4>(a: T, b: T1, c: T2, d: T3, e: T4): Int64 {
    func test_uint<T, T1, T2, T3, T4>(a: T, b: T1, c: T2, d: T3, e: T4) {
        var gengricsvar = a
        var gengricsvar1 = b
        var gengricsvar2 = c
        var gengricsvar3 = d
        var gengricsvar4 = e
        return gengricsvar
    }
    var testa = test_uint(a, b, c, d, e)
    return 0
}

public func genericsfun_float<T, T1, T2>(a: T, b: T1, c: T2): Int64 {
    func test_float<T, T1, T2>(a: T, b: T1, c: T2) {
        var gengricsvar = a
        var gengricsvar1 = b
        var gengricsvar2 = c
        return gengricsvar
    }
    var testa = test_float(a, b, c)
    return 0
}

public func genericsfun<T, T1, T2>(a: T, b: T1, c: T2): Int64 {
    func test_1<T, T1, T2>(a: T, b: T1, c: T2) {
        var gengricsvar = a
        var gengricsvar1 = b
        var gengricsvar2 = c
        return gengricsvar
    }
    var testa = test_1(a, b, c)
    return 0
}

public func genericsfun_c<T, T1, T2>(a: T, b: T1, c: T2): Int64 {
    func test_c<T, T1, T2>(a: T, b: T1, c: T2) {
        var gengricsvar = a
        var gengricsvar1 = b
        var gengricsvar2 = c
        return gengricsvar
    }
    var testa = test_c(a, b, c)
    return 0
}

public func genericsfun_list<T, T1>(a: T, b: T1): Int64 {
    func test_list<T, T1>(a: T, b: T1) {
        var gengricsvar = a
        var gengricsvar1 = b
        return gengricsvar
    }
    var testa = test_list(a, b)
    return 0
}

public func genericsfun_type<T, T1, T2, T3, T4, T5, T6>(a: T, b: T1, c: T2, d: T3, e: T4, f: T5, g: T6): Int64 {
    func test_type<T, T1, T2, T3, T4, T5, T6>(a: T, b: T1, c: T2, d: T3, e: T4, f: T5, g: T6) {
        var gengricsvar = a
        var gengricsvar1 = b
        var gengricsvar2 = c
        var gengricsvar3 = d
        var gengricsvar4 = e
        var gengricsvar5 = f
        var gengricsvar6 = g
        return gengricsvar
    }
    var testa = test_type(a, b, c, d, e, f, g)
    return 0
}

main() {
    var vi8: Int8 = 8
    var vi16: Int16 = 16
    var vi32: Int32 = 32
    var vi64: Int64 = 64
    var vin: IntNative = 100
    var vui8: UInt8 = 8
    var vui16: UInt16 = 16
    var vui32: UInt32 = 32
    var vui64: UInt64 = 64
    var vuin: UIntNative = 100
    var f16: Float16 = 16.16
    var f32: Float32 = 32.32
    var f64: Float64 = 64.64
    var vbool: Bool = true
    var vrune: Rune = 'a'
    var vtuple: (Int8, UInt8, Float16, Bool) = (-8, 8, 16.16, false)
    var vunit: Unit = ()
    var vcptr = CPointer<Int8>()
    let cstr: CString = unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") }
    var vcfunc = CFunc<() -> Unit>(vcptr)
    var str: String = "Cangjie仓颉"
    var 字符串: String = "Cangjie"
    var vrange: For<Int64> = 1..10 : 1
    var varr: A<Int64> = [1, 2, 3]
    var vlist: AL<Int64> = AL<Int64>([1, 2, 3])
    var vhm: HM<String, Int64> = HM<String, Int64>([("a", 1), ("b", 2)])
    var vhs: HSet<Int64> = HSet<Int64>(1, 2, 3)
    var vcptr1 = CP<Int8>()
    var varr1: VA<Int64, Int64> = [1, 2]
    genericsfun_int(vi8, vi16, vi32, vi64, vin)
    genericsfun_uint(vui8, vui16, vui32, vui64, vuin)
    genericsfun_float(f16, f32, f64)
    genericsfun(vbool, vrune, vunit)
    genericsfun_c(vcptr, cstr, vcfunc)
    genericsfun_list(vtuple, str)
    genericsfun_type(vrange, vlist, varr, vhm, vhs, vcptr1, varr1)
    return 0
}
