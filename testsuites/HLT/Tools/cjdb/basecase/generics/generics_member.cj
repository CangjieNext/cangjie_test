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

type For1<T> = For<T>

type VA<T, K> = VArray<Int64, $2>

type HM<K, V> = HashMap<K, V>

type HM1<K, V> = HM<K, V>

type CP<T> = CPointer<T>

type CP1<T> = CP<T>

public interface I3<T3> {
    func fun_I2(para1: T3): Unit
}

public open class Rect2<T, T1, T2> {
    public func ffloat(a: T, b: T1, c: T2): Int64 {
        var a1 = a
        var a2 = b
        var a3 = c
        return 0
    }
    public open func ftuple(a: T): Int64 {
        var a1 = a
        return 0
    }
}

class Rect1<T, T1, T2, T3, T4> <: Rect2<T, T1, T2> & I3<T3> {
    public static func fint(a: T, b: T1, c: T2, d: T3, e: T4): Int64 {
        var a1 = a
        var a2 = b
        var a3 = c
        var a4 = d
        var a5 = e
        return 0
    }
    public static func frange(a: T): Int64 {
        var a1 = a
        return 0
    }
    public func fuint(a: T, b: T1, c: T2, d: T3, e: T4): Int64 {
        var a1 = a
        var a2 = b
        var a3 = c
        var a4 = d
        var a5 = e
        return 0
    }
    public func fun_I2(para1: T3): Unit {
        var vf1 = para1
        var a = 10
    }
    public override func ftuple(p1: T): Int64 { //重写基类泛型函数
        var a = p1
        return 0
    }
    public func fuint(a: T): Int64 {
        var a1 = a
        return 0
    }
    public func ftest(a: T): Int64 {
        var a1 = a
        return 0
    }
}

public enum TimeUnit1<T> {
    Year(T) | Month(T)

    public func funcdemo1(): TimeUnit1<T> {
        print("I am in instance func.\n")
        return this
    }
    public func funcdemo1(a: T): Int64 {
        var t1 = a
        return 0
    }
    public func foo(b: T): Int64 {
        var c = b
        return 0
    }
}

struct Sect1<T, T3> {
    public func fint(a: T): Int64 {
        var a1 = a
        return 0
    }

    public func fstr(a: T, b: T3): Int64 {
        var a1 = a
        var a2 = b

        return 0
    }

    public func fstr(a: T): Int64 {
        var a1 = a
        return 0
    }
}

main() {
    let rectint = Rect1<Int8, Int16, Int32, Int64, IntNative>.fint(8, 16, 32, 64, 100)
    let rectuint = Rect1<UInt8, UInt16, UInt32, UInt64, UIntNative>().fuint(8, 16, 32, 64, 100)
    let rectfloat = Rect1<Float16, Float32, Float64, Int8, Int64>().ffloat(16.16, 32.32, 64.64)
    let rectbool = Rect1<Bool, Int64, Int64, Bool, Int64>().fun_I2(true)
    let rectrune = Rect1<Rune, UInt16, UInt32, UInt64, UIntNative>().fuint(r'a')
    let recttuple = Rect1<(Int64, Int64), UInt16, UInt32, UInt64, UIntNative>().ftuple((16, 16))
    let enumuint = TimeUnit1<Unit>.Year(()).foo(())
    let enumcstr = TimeUnit1<CString>
        .Year(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
        .funcdemo1(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") })
    let sectcfunc = Sect1<CFunc<() -> Unit>, Int64>().fint(CFunc<() -> Unit>(CPointer<Int8>()))
    let sectstr = Sect1<String, Int64>().fstr("cangjie")
    let rectrange = Rect1<For1<Int64>, Int16, Int32, Int64, IntNative>.fint(1..10 : 2, 16, 32, 64, 100)
    let rectarr = Rect1<A<Int64>, Int16, Int32, Int64, IntNative>().ftest([1, 2, 3])
    let rectlist = Rect1<AL<Int64>, Int64, Int64, AL<Int64>, Int64>().fun_I2(AL<Int64>([1, 2, 3]))
    let recthm = Rect1<HM1<String, Int64>, UInt16, UInt32, UInt64, UIntNative>().fuint(
        HM1<String, Int64>(("a", 1), ("b", 2)))
    let recths = Rect1<HSet<Int64>, UInt16, UInt32, UInt64, UIntNative>().ftuple(HSet<Int64>(1, 2, 3))
    let enumcp = TimeUnit1<CP1<Int64>>.Year(CP1<Int64>()).funcdemo1(CP1<Int64>())
    return 0
}
