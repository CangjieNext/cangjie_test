/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

type I8 = Int8

type I16 = Int16

type I32 = Int32

type I64 = Int64

type In = IntNative

type UI8 = UInt8

type UI16 = UInt16

type UI32 = UInt32

type UI64 = UInt64

type UIn = UIntNative

type F16 = Float16

type F32 = Float32

type F64 = Float64

type Bl = Bool

type Re = Rune

type Ut = Unit

type Cstr = CString

type Str = String

type A<T> = Array<T>

type A02<T> = A<T>

type AL<T> = ArrayList<T>

type AL02<T> = AL<T>

type HSet<T> = HashSet<T>

type For<T> = Range<T>

type For1<T> = For<T>

type VA<T, K> = VArray<Int64, $2>

type HM<K, V> = HashMap<K, V>

type CP<T> = CPointer<T>

type CP1<T> = CP<T>

type Cl1<T> = C1<T>

type Cl2<T> = C2<T>

type Cl4<T> = C4<T>

type Sl1<T> = S1<T>

type Sl2<T> = S2<T>

type Sl4<T> = S4<T>

class C1<T> {
    var c1_a: T
    public init(a: T) {
        c1_a = a
        var aa = 10
    }
}

class C2<T> {
    var c2_a: T
    public init(a: T) {
        c2_a = a
        var aa = 10
    }
}

class C3<T> {
    var c3_a: T
    public init(a: T) {
        c3_a = a
        var aa = 10
    }
}

class C4<T> {
    var c4_a: T
    public init(a: T) {
        c4_a = a
        var aa = 10
    }
}

struct S1<T> {
    var s1_a: T
    public init(a: T) {
        s1_a = a
        var aa = 10
    }
}

struct S2<T> {
    var s2_a: T
    public init(a: T) {
        s2_a = a
        var aa = 10
    }
}

struct S3<T> {
    var s3_a: T
    public init(a: T) {
        s3_a = a
        var aa = 10
    }
}

struct S4<T> {
    var s4_a: T
    public init(a: T) {
        s4_a = a
        var aa = 10
    }
}

main() {
    var ai8 = Cl1<S3<I8>>(S3<I8>(8))
    var ai16 = Cl1<S3<I16>>(S3<I16>(16))
    var ai32 = Cl1<S3<I32>>(S3<I32>(32))
    var ai64 = Cl1<S3<I64>>(S3<I64>(64))
    var ain = Cl1<S3<In>>(S3<In>(100))
    var bui8 = Sl1<UI8>(8)
    var bui16 = Sl1<UI16>(16)
    var bui32 = Sl1<UI32>(32)
    var bui64 = Sl1<UI64>(64)
    var buin = Sl1<UIn>(100)
    var cf16 = Cl2<C3<F16>>(C3<F16>(16.16))
    var cf32 = Cl2<C3<F32>>(C3<F32>(32.32))
    var cf64 = Cl2<C3<F64>>(C3<F64>(64.64))
    var dBl = Sl2<S3<Bl>>(S3<Bl>(true))
    var eRe = Cl4<C3<Re>>(C3<Re>(r'a'))
    var ftupe = Sl2<C3<(I64, UI64)>>(C3<(I64, UI64)>((-64, 64)))
    var gunit = Cl4<S3<Ut>>(S3<Ut>(()))
    var hcstr = Sl2<Cstr>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
    var icfunc = Cl4<C3<CFunc<() -> Unit>>>(C3<CFunc<() -> Unit>>(CFunc<() -> Unit>(CPointer<I8>())))
    var jstr = Sl4<S3<Str>>(S3<Str>("cangjie"))
    var krange = Cl2<For1<I64>>(1..10 : 2)
    var larr = Sl4<C3<A<I64>>>(C3<A<I64>>([1, 2, 3]))
    var mlist = Sl4<AL<I64>>(AL<I64>([1, 2, 3]))
    var nhm = Cl4<C3<HM<Str, I64>>>(C3<HM<Str, I64>>(HM<Str, I64>(("a", 1), ("b", 2))))
    var ohs = Sl4<S3<HSet<I64>>>(S3<HSet<I64>>(HSet<I64>([1, 2, 3])))
    var pcp = Cl4<CP1<I64>>(CP1<I64>())
    return 0
}
